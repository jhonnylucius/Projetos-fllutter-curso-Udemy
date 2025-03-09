import 'package:pj1/models/budget/budget_item.dart';

class BudgetSummary {
  double totalOriginal;
  double totalOptimized;
  double savings;
  Map<String, double> totalByLocation;

  BudgetSummary({
    required this.totalOriginal,
    required this.totalOptimized,
    required this.savings,
    required this.totalByLocation,
  });

  Map<String, dynamic> toMap() {
    return {
      'totalOriginal': totalOriginal,
      'totalOptimized': totalOptimized,
      'savings': savings,
      'totalByLocation': totalByLocation,
    };
  }

  factory BudgetSummary.fromMap(Map<String, dynamic> map) {
    return BudgetSummary(
      totalOriginal: map['totalOriginal']?.toDouble() ?? 0.0,
      totalOptimized: map['totalOptimized']?.toDouble() ?? 0.0,
      savings: map['savings']?.toDouble() ?? 0.0,
      totalByLocation: Map<String, double>.from(map['totalByLocation'] ?? {}),
    );
  }

  void calculateSummary(List<BudgetItem> items) {
    totalByLocation = {};
    totalOriginal = 0.0;
    totalOptimized = 0.0;

    for (var item in items) {
      // Calcula total por localização
      item.prices.forEach((locationId, price) {
        totalByLocation[locationId] =
            (totalByLocation[locationId] ?? 0.0) + price;
      });

      // Adiciona ao total original (usando o primeiro preço encontrado)
      if (item.prices.isNotEmpty) {
        totalOriginal += item.prices.values.first;
      }

      // Adiciona ao total otimizado (usando o melhor preço)
      totalOptimized += item.bestPrice;
    }

    // Calcula a economia
    savings = totalOriginal - totalOptimized;
  }
}
