import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pj1/models/budget/budget.dart';
import 'package:pj1/models/budget/budget_item.dart';
import 'package:pj1/models/budget/budget_location.dart';
import 'package:pj1/models/budget/budget_summary.dart';
import 'package:pj1/models/budget/price_history.dart';
import 'package:pj1/services/price_alert_service.dart';
import 'package:pj1/services/price_history_service.dart';
import 'package:uuid/uuid.dart';

class BudgetService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String userId;

  BudgetService({required this.userId});

  // Criar novo orçamento

  CollectionReference<Map<String, dynamic>> get _budgets =>
      _firestore.collection('users').doc(userId).collection('budgets');

  Future<Budget> createBudget(String title) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('Usuário não autenticado');
      }

      final budget = Budget(
        id: const Uuid().v4(),
        title: title,
        date: DateTime.now(),
        locations: [],
        items: [],
        summary: BudgetSummary(
          totalOriginal: 0,
          totalOptimized: 0,
          savings: 0,
          totalByLocation: {},
        ),
        userId: userId,
      );

      print('Tentando criar orçamento: ${budget.toMap()}');
      await _budgets.doc(budget.id).set(budget.toMap());
      print('Orçamento criado com sucesso!');

      return budget;
    } catch (e) {
      print('Erro ao criar orçamento: $e');
      throw e;
    }
  }

  // Buscar todos os orçamentos do usuário
  Stream<List<Budget>> getBudgets() {
    return _budgets.orderBy('date', descending: true).snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Budget.fromMap(doc.data())).toList());
  }

  // Buscar um orçamento específico
  Future<Budget?> getBudget(String budgetId) async {
    final doc = await _budgets.doc(budgetId).get();
    if (!doc.exists) return null;
    return Budget.fromMap(doc.data()!);
  }

  // Adicionar localização ao orçamento
  Future<void> addLocation(String budgetId, BudgetLocation location) async {
    final budget = await getBudget(budgetId);
    if (budget == null) return;

    budget.addLocation(location);
    await _budgets.doc(budgetId).update(budget.toMap());
  }

  // Adicionar item ao orçamento
  Future<void> addItem(String budgetId, BudgetItem item) async {
    final budget = await getBudget(budgetId);
    if (budget == null) return;

    budget.addItem(item);
    await _budgets.doc(budgetId).update(budget.toMap());
  }

  // Remover localização do orçamento
  Future<void> removeLocation(String budgetId, String locationId) async {
    final budget = await getBudget(budgetId);
    if (budget == null) return;

    budget.removeLocation(locationId);
    await _budgets.doc(budgetId).update(budget.toMap());
  }

  // Remover item do orçamento
  Future<void> removeItem(String budgetId, String itemId) async {
    final budget = await getBudget(budgetId);
    if (budget == null) return;

    budget.removeItem(itemId);
    await _budgets.doc(budgetId).update(budget.toMap());
  }

  // Excluir orçamento
  Future<void> deleteBudget(String budgetId) async {
    await _budgets.doc(budgetId).delete();
  }

  // Atualizar título do orçamento
  Future<void> updateBudgetTitle(String budgetId, String newTitle) async {
    await _budgets.doc(budgetId).update({'title': newTitle});
  }

  // Gerar relatório de economia
  Future<Map<String, dynamic>> generateSavingsReport(String budgetId) async {
    final budget = await getBudget(budgetId);
    if (budget == null) throw Exception('Orçamento não encontrado');

    return {
      'totalOriginal': budget.summary.totalOriginal,
      'totalOptimized': budget.summary.totalOptimized,
      'savings': budget.summary.savings,
      'savingsPercentage': budget.summary.totalOriginal > 0
          ? (budget.summary.savings / budget.summary.totalOriginal) * 100
          : 0,
      'bestPricesByItem': budget.items
          .map((item) => {
                'name': item.name,
                'bestPrice': item.bestPrice,
                'bestLocation': budget.locations
                    .firstWhere((loc) => loc.id == item.bestPriceLocation)
                    .name,
                'potentialSavings': item.prices.values.first -
                    item.bestPrice, // economia por item
              })
          .toList(),
    };
  }

  Future<void> updateAllPrices(Budget budget) async {
    final batch = _firestore.batch();
    final docRef = _budgets.doc(budget.id);

    // Atualizar documento inteiro com novos preços
    batch.update(docRef, budget.toMap());

    // Commit das alterações
    await batch.commit();
  }

  Future<void> updateItemPrice(
    String budgetId,
    String itemId,
    String locationId,
    double price,
  ) async {
    try {
      // Prevenir atualizações desnecessárias
      final budget = await getBudget(budgetId);
      if (budget == null) return;

      final item = budget.items.firstWhere((i) => i.id == itemId);
      if (item.prices[locationId] == price)
        return; // Se o preço não mudou, retorna

      // Registrar histórico apenas se houver mudança real
      final priceHistoryService = PriceHistoryService(userId: userId);
      final variation = await priceHistoryService.calculatePriceVariation(
        budgetId,
        itemId,
        locationId,
        price,
      );

      // Atualizar o preço
      item.prices[locationId] = price;
      item.updateBestPrice();
      budget.updateSummary();

      // Fazer uma única atualização no Firestore
      final batch = _firestore.batch();
      final docRef = _budgets.doc(budgetId);

      // Atualizar o documento do orçamento
      batch.update(docRef, budget.toMap());

      // Registrar histórico de preço
      final historyRef = docRef.collection('price_history').doc();
      batch.set(
          historyRef,
          PriceHistory(
            itemId: itemId,
            locationId: locationId,
            price: price,
            date: DateTime.now(),
            variation: variation,
          ).toMap());

      // Commit das alterações em uma única transação
      await batch.commit();

      // Notificar apenas se a variação for significativa
      if (variation.abs() >= 5.0) {
        final location = budget.locations.firstWhere((l) => l.id == locationId);
        final alertService = PriceAlertService();
        await alertService.initialize();
        await alertService.showPriceAlert(
          item.name,
          location.name,
          variation,
        );
      }
    } catch (e) {
      print('Erro ao atualizar preço: $e');
      rethrow;
    }
  }
}
