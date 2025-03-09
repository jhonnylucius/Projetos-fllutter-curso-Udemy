import 'package:pj1/models/budget/budget.dart';
import 'package:pj1/models/budget/budget_item.dart';

class BudgetCalculator {
  static Map<String, double> calculateTotalsByLocation(Budget budget) {
    final totals = <String, double>{};

    for (var item in budget.items) {
      item.prices.forEach((locationId, price) {
        totals[locationId] = (totals[locationId] ?? 0) + price;
      });
    }

    return totals;
  }

  static Map<String, List<BudgetItem>> getBestPricesByLocation(Budget budget) {
    final bestPrices = <String, List<BudgetItem>>{};

    for (var item in budget.items) {
      if (item.bestPriceLocation.isNotEmpty) {
        if (!bestPrices.containsKey(item.bestPriceLocation)) {
          bestPrices[item.bestPriceLocation] = [];
        }
        bestPrices[item.bestPriceLocation]!.add(item);
      }
    }

    return bestPrices;
  }

  static double calculatePotentialSavings(Budget budget) {
    double totalSavings = 0;

    for (var item in budget.items) {
      if (item.prices.isNotEmpty) {
        final maxPrice = item.prices.values.reduce((a, b) => a > b ? a : b);
        totalSavings += maxPrice - item.bestPrice;
      }
    }

    return totalSavings;
  }

  static Map<String, double> calculateSavingsByCategory(Budget budget) {
    final savings = <String, double>{};

    for (var item in budget.items) {
      if (item.prices.isNotEmpty) {
        final maxPrice = item.prices.values.reduce((a, b) => a > b ? a : b);
        final categorySaving = maxPrice - item.bestPrice;
        savings[item.category] = (savings[item.category] ?? 0) + categorySaving;
      }
    }

    return savings;
  }
}
