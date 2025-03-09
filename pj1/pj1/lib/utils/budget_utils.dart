import 'dart:math';

import 'package:pj1/data/default_items.dart';
import 'package:pj1/models/budget/budget.dart';

class BudgetUtils {
  // Filtrar itens por categoria
  static List<Map<String, dynamic>> filterByCategory(String category) {
    return defaultItems
        .where((item) =>
            (item['category'] as String?)?.toLowerCase() ==
            category.toLowerCase())
        .toList();
  }

  // Buscar produtos por texto
  static List<Map<String, dynamic>> searchProducts(String query) {
    final searchLower = query.toLowerCase();
    return defaultItems.where((item) {
      final name = item['name']?.toString().toLowerCase() ?? '';
      final category = item['category']?.toString().toLowerCase() ?? '';
      final subcategory = item['subcategory']?.toString().toLowerCase() ?? '';

      return name.contains(searchLower) ||
          category.contains(searchLower) ||
          subcategory.contains(searchLower);
    }).toList();
  }

  // Conversão entre unidades
  static double convertUnit(double value, String fromUnit, String toUnit,
      {double? density}) {
    // Conversões de peso
    if (fromUnit == 'g' && toUnit == 'kg') return value / 1000;
    if (fromUnit == 'kg' && toUnit == 'g') return value * 1000;

    // Conversões de volume
    if (fromUnit == 'ml' && toUnit == 'L') return value / 1000;
    if (fromUnit == 'L' && toUnit == 'ml') return value * 1000;

    // Conversões entre peso e volume (requer densidade)
    if (density != null) {
      if ((fromUnit == 'ml' || fromUnit == 'L') &&
          (toUnit == 'g' || toUnit == 'kg')) {
        // Converter para ml primeiro
        final ml = fromUnit == 'L' ? value * 1000 : value;
        // Converter para gramas usando densidade
        final g = ml * density;
        // Converter para unidade final
        return toUnit == 'kg' ? g / 1000 : g;
      }

      if ((fromUnit == 'g' || fromUnit == 'kg') &&
          (toUnit == 'ml' || toUnit == 'L')) {
        // Converter para g primeiro
        final g = fromUnit == 'kg' ? value * 1000 : value;
        // Converter para ml usando densidade
        final ml = g / density;
        // Converter para unidade final
        return toUnit == 'L' ? ml / 1000 : ml;
      }
    }

    // Se não houver conversão possível, retorna o valor original
    return value;
  }

  // Cálculo de preço por unidade
  static double calculatePricePerUnit(
      double price, double quantity, String unit,
      {String targetUnit = 'kg'} // unidade para comparação
      ) {
    // Converter para a unidade base primeiro
    double baseQuantity = convertUnit(quantity, unit, targetUnit);
    if (baseQuantity == 0) return 0;
    return price / baseQuantity;
  }

  // Comparar preços entre diferentes apresentações
  static Map<String, dynamic> comparePrices(List<Map<String, dynamic>> prices) {
    if (prices.isEmpty) return {};

    // Converter todos os preços para a mesma unidade base
    final normalizedPrices = prices.map((p) {
      final price = p['price'] as double;
      final quantity = p['quantity'] as double;
      final unit = p['unit'] as String;

      return {
        'original': p,
        'pricePerUnit': calculatePricePerUnit(price, quantity, unit),
      };
    }).toList();

    // Ordenar por preço por unidade
    normalizedPrices.sort((a, b) =>
        (a['pricePerUnit'] as double).compareTo(b['pricePerUnit'] as double));

    // Retornar o melhor preço e a economia em relação ao pior
    final cheapest = normalizedPrices.first;
    final mostExpensive = normalizedPrices.last;
    final saving = (mostExpensive['pricePerUnit'] as double) -
        (cheapest['pricePerUnit'] as double);

    return {
      'bestDeal': cheapest['original'],
      'pricePerUnit': cheapest['pricePerUnit'],
      'potentialSaving': saving,
      'savingPercentage':
          (saving / (mostExpensive['pricePerUnit'] as double)) * 100,
    };
  }

  static Map<String, double> calculateTotalsByLocation(Budget budget) {
    final totals = <String, double>{};

    // Para cada localização
    for (var location in budget.locations) {
      var locationTotal = 0.0;

      // Para cada item
      for (var item in budget.items) {
        // Soma o preço do item nesta localização
        final price = item.prices[location.id] ?? 0;
        locationTotal += price;
      }

      // Armazena o total da localização
      totals[location.id] = locationTotal;
    }

    return totals;
  }

  // Calcular melhor localização geral
  static String? findBestOverallLocation(Budget budget) {
    final totals = calculateTotalsByLocation(budget);
    if (totals.isEmpty) return null;

    // Encontra a localização com menor total
    var bestLocationId = totals.entries.first.key;
    var lowestTotal = totals.entries.first.value;

    for (var entry in totals.entries) {
      if (entry.value < lowestTotal) {
        lowestTotal = entry.value;
        bestLocationId = entry.key;
      }
    }

    return bestLocationId;
  }

  // Calcular economia por localização
  static Map<String, double> calculateSavingsByLocation(Budget budget) {
    final totals = calculateTotalsByLocation(budget);
    final savings = <String, double>{};

    // Se não houver totais, retorna mapa vazio
    if (totals.isEmpty) return savings;

    // Encontra o maior total
    final highestTotal = totals.values.reduce(max);

    // Calcula economia em relação ao maior total
    for (var entry in totals.entries) {
      savings[entry.key] = highestTotal - entry.value;
    }

    return savings;
  }

  // Calcular percentual de economia por localização
  static Map<String, double> calculateSavingsPercentageByLocation(
      Budget budget) {
    final totals = calculateTotalsByLocation(budget);
    final percentages = <String, double>{};

    // Se não houver totais, retorna mapa vazio
    if (totals.isEmpty) return percentages;

    // Encontra o maior total
    final highestTotal = totals.values.reduce(max);

    // Calcula percentual de economia
    for (var entry in totals.entries) {
      final saving = highestTotal - entry.value;
      percentages[entry.key] = (saving / highestTotal) * 100;
    }

    return percentages;
  }
}
