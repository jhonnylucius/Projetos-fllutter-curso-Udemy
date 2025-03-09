import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pj1/models/budget/price_history.dart';

class PriceHistoryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String userId;

  PriceHistoryService({required this.userId});

  CollectionReference<Map<String, dynamic>> _getHistoryRef(String budgetId) {
    return _firestore
        .collection('users/$userId/budgets/$budgetId/price_history');
  }

  // Adicionar novo registro de preço
  Future<void> addPriceRecord(
    String budgetId,
    PriceHistory history,
  ) async {
    await _getHistoryRef(budgetId).add(history.toMap());
  }

  // Buscar histórico de preços de um item
  Stream<List<PriceHistory>> getItemPriceHistory(
    String budgetId,
    String itemId,
  ) {
    return _getHistoryRef(budgetId)
        .where('itemId', isEqualTo: itemId)
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => PriceHistory.fromMap(doc.data()))
            .toList());
  }

  // Calcular variação de preço
  Future<double> calculatePriceVariation(
    String budgetId,
    String itemId,
    String locationId,
    double newPrice,
  ) async {
    final snapshot = await _getHistoryRef(budgetId)
        .where('itemId', isEqualTo: itemId)
        .where('locationId', isEqualTo: locationId)
        .orderBy('date', descending: true)
        .limit(1)
        .get();

    if (snapshot.docs.isEmpty) return 0;

    final lastPrice = PriceHistory.fromMap(snapshot.docs.first.data()).price;
    if (lastPrice == 0) return 0;

    return ((newPrice - lastPrice) / lastPrice) * 100;
  }

  // Buscar itens com variação significativa
  Stream<List<PriceHistory>> getSignificantVariations(
    String budgetId, {
    double threshold = 5.0, // Variação mínima em %
  }) {
    return _getHistoryRef(budgetId)
        .where('variation', isGreaterThan: threshold)
        .orderBy('variation', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => PriceHistory.fromMap(doc.data()))
            .toList());
  }
}
