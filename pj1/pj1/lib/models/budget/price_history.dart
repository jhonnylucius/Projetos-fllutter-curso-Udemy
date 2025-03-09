class PriceHistory {
  final String itemId;
  final String locationId;
  final double price;
  final DateTime date;
  final double variation; // Variação em relação ao preço anterior

  PriceHistory({
    required this.itemId,
    required this.locationId,
    required this.price,
    required this.date,
    this.variation = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'itemId': itemId,
      'locationId': locationId,
      'price': price,
      'date': date.toIso8601String(),
      'variation': variation,
    };
  }

  factory PriceHistory.fromMap(Map<String, dynamic> map) {
    return PriceHistory(
      itemId: map['itemId'] ?? '',
      locationId: map['locationId'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      date: DateTime.parse(map['date']),
      variation: map['variation']?.toDouble() ?? 0.0,
    );
  }
}
