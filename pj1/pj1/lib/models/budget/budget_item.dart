import 'package:pj1/utils/budget_utils.dart';

class BudgetItem {
  String id;
  String name;
  String category;
  String unit;
  double quantity;
  Map<String, double> prices;
  String bestPriceLocation;
  double bestPrice;

  BudgetItem({
    required this.id,
    required this.name,
    required this.category,
    this.unit = 'un',
    this.quantity = 1,
    required this.prices,
    required this.bestPriceLocation,
    required this.bestPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'unit': unit,
      'quantity': quantity,
      'prices': prices,
      'bestPriceLocation': bestPriceLocation,
      'bestPrice': bestPrice,
    };
  }

  factory BudgetItem.fromMap(Map<String, dynamic> map) {
    return BudgetItem(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      category: map['category'] ?? '',
      unit: map['unit'] ?? 'un',
      quantity: map['quantity']?.toDouble() ?? 1.0,
      prices: Map<String, double>.from(map['prices'] ?? {}),
      bestPriceLocation: map['bestPriceLocation'] ?? '',
      bestPrice: map['bestPrice']?.toDouble() ?? 0.0,
    );
  }

  void updateBestPrice() {
    if (prices.isEmpty) {
      bestPrice = 0.0;
      bestPriceLocation = '';
      return;
    }

    var lowestPrice = double.infinity;
    var lowestPriceLocation = '';

    prices.forEach((location, price) {
      if (price < lowestPrice) {
        lowestPrice = price;
        lowestPriceLocation = location;
      }
    });

    bestPrice = lowestPrice;
    bestPriceLocation = lowestPriceLocation;
  }

  // Converte o preço para uma nova unidade
  void convertToUnit(String newUnit, {double? density}) {
    if (newUnit == unit) return;

    // Converte cada preço para a nova unidade
    final newPrices = <String, double>{};
    prices.forEach((location, price) {
      final convertedPrice = BudgetUtils.convertUnit(
        price,
        unit,
        newUnit,
        density: density,
      );
      newPrices[location] = convertedPrice;
    });

    // Atualiza os preços e a unidade
    prices = newPrices;
    unit = newUnit;
    updateBestPrice();
  }

  // Calcula o preço por unidade base (kg, L ou unidade)
  double getPricePerUnit({String? targetUnit}) {
    if (quantity == 0) return 0;
    final baseUnit = targetUnit ?? unit;

    return BudgetUtils.calculatePricePerUnit(
      bestPrice,
      quantity,
      unit,
      targetUnit: baseUnit,
    );
  }

  // Compara preços entre diferentes apresentações do mesmo produto
  Map<String, dynamic> compareUnitPrices() {
    final pricesComparison = prices.entries.map((entry) {
      return {
        'location': entry.key,
        'price': entry.value,
        'quantity': quantity,
        'unit': unit,
      };
    }).toList();

    return BudgetUtils.comparePrices(pricesComparison);
  }

  // Calcula a economia em relação ao preço mais alto
  double calculateSavings() {
    if (prices.isEmpty) return 0;

    final highestPrice = prices.values.reduce((a, b) => a > b ? a : b);
    return highestPrice - bestPrice;
  }

  // Calcula o percentual de economia
  double calculateSavingsPercentage() {
    if (prices.isEmpty || bestPrice == 0) return 0;

    final highestPrice = prices.values.reduce((a, b) => a > b ? a : b);
    return ((highestPrice - bestPrice) / highestPrice) * 100;
  }
}
