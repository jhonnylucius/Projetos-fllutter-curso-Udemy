import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pj1/models/budget/budget.dart';
import 'package:pj1/models/budget/budget_item.dart';
import 'package:pj1/models/budget/budget_location.dart';
import 'package:pj1/models/budget/budget_summary.dart';
import 'package:pj1/models/budget/price_history.dart';
import 'package:synchronized/synchronized.dart';
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
      rethrow;
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

  Future<void> updateMultiplePrices(
    String budgetId,
    Map<String, Map<String, double>> updates, // {itemId: {locationId: price}}
  ) async {
    try {
      final lock = Lock();
      await lock.synchronized(() async {
        final budget = await getBudget(budgetId);
        if (budget == null) return;

        final batch = _firestore.batch();
        final budgetRef = _budgets.doc(budgetId);
        final historyRef = budgetRef.collection('price_history');

        // Processar todas as atualizações
        bool hasChanges = false;
        for (var itemId in updates.keys) {
          final item = budget.items.firstWhere((i) => i.id == itemId);
          final priceUpdates = updates[itemId]!;

          for (var locationId in priceUpdates.keys) {
            final newPrice = priceUpdates[locationId]!;
            final currentPrice = item.prices[locationId];

            // Só atualiza se o preço realmente mudou
            if (currentPrice != newPrice) {
              hasChanges = true;
              item.prices[locationId] = newPrice;

              // Registrar no histórico
              batch.set(
                historyRef.doc(),
                PriceHistory(
                  itemId: itemId,
                  locationId: locationId,
                  price: newPrice,
                  date: DateTime.now(),
                  variation: currentPrice != null
                      ? ((newPrice - currentPrice) / currentPrice) * 100
                      : 0,
                ).toMap(),
              );
            }
          }

          // Atualizar melhor preço do item
          item.updateBestPrice();
        }

        // Só commit se houver mudanças reais
        if (hasChanges) {
          budget.updateSummary();
          batch.update(budgetRef, budget.toMap());
          await batch.commit();
        }
      });
    } catch (e) {
      print('Erro ao atualizar múltiplos preços: $e');
      rethrow;
    }
  }

  Future<double> updateItemPrice(
    String budgetId,
    String itemId,
    String locationId,
    double price,
  ) async {
    try {
      final lock = Lock();
      double variation = 0;

      await lock.synchronized(() async {
        print('Iniciando atualização de preço:');
        print('Budget: $budgetId');
        print('Item: $itemId');
        print('Local: $locationId');
        print('Novo preço: $price');

        final budget = await getBudget(budgetId);
        if (budget == null) {
          print('Orçamento não encontrado!');
          return 0;
        }

        final item = budget.items.firstWhere((i) => i.id == itemId);
        final oldPrice = item.prices[locationId];
        print('Preço atual: $oldPrice');

        // Verificar se o preço realmente mudou
        if (oldPrice == price) {
          print('Preço não mudou, ignorando atualização');
          return 0;
        }

        // Calcular variação
        variation = await _calculateVariation(
            budgetId, itemId, locationId, price, oldPrice ?? 0);

        // Atualizar preço no item
        item.prices[locationId] = price;
        item.updateBestPrice();
        budget.updateSummary();

        print('Preço atualizado no objeto:');
        print('Novo melhor preço: ${item.bestPrice}');
        print('Variação calculada: $variation%');

        // Preparar batch
        final batch = _firestore.batch();
        final budgetRef = _budgets.doc(budgetId);

        // Atualizar documento principal
        batch.update(budgetRef, budget.toMap());

        // Registrar histórico
        final historyRef = budgetRef.collection('price_history').doc();
        batch.set(
          historyRef,
          PriceHistory(
            itemId: itemId,
            locationId: locationId,
            price: price,
            date: DateTime.now(),
            variation: variation,
          ).toMap(),
        );

        // Executar operações
        await batch.commit();
        print('Alterações salvas no Firestore');

        return variation;
      });

      return variation;
    } catch (e) {
      print('Erro ao atualizar preço: $e');
      rethrow;
    }
  }

  // No BudgetService, antes do último } da classe
  Future<double> _calculateVariation(
    String budgetId,
    String itemId,
    String locationId,
    double newPrice,
    double oldPrice,
  ) async {
    if (oldPrice == 0) return 0;

    try {
      // Calcular variação percentual
      final variation = ((newPrice - oldPrice) / oldPrice) * 100;

      print('DEBUG - Cálculo de variação:');
      print('Preço anterior: $oldPrice');
      print('Novo preço: $newPrice');
      print('Variação: $variation%');

      return variation;
    } catch (e) {
      print('Erro ao calcular variação: $e');
      return 0;
    }
  }
}
