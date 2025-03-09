class BudgetLocation {
  String id;
  String name;
  String address;
  DateTime priceDate;

  BudgetLocation({
    required this.id,
    required this.name,
    required this.address,
    required this.priceDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'priceDate': priceDate.toIso8601String(),
    };
  }

  factory BudgetLocation.fromMap(Map<String, dynamic> map) {
    return BudgetLocation(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      priceDate:
          DateTime.parse(map['priceDate'] ?? DateTime.now().toIso8601String()),
    );
  }
}
