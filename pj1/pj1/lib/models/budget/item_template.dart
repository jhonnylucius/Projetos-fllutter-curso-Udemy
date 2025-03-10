class ItemTemplate {
  final String name;
  final String category;
  final String? subcategory;
  final List<String> availableUnits;
  final String defaultUnit;
  final double defaultQuantity;

  const ItemTemplate({
    required this.name,
    required this.category,
    this.subcategory,
    required this.availableUnits,
    required this.defaultUnit,
    this.defaultQuantity = 1.0, // Valor padrão
  });

  factory ItemTemplate.fromJson(Map<String, dynamic> json) {
    return ItemTemplate(
      name: json['name'] as String,
      category: json['category'] as String,
      subcategory: json['subcategory'] as String?,
      availableUnits: List<String>.from(json['availableUnits'] as List),
      defaultUnit: json['defaultUnit'] as String,
      defaultQuantity: (json['defaultQuantity'] as num?)?.toDouble() ?? 1.0,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'category': category,
        'subcategory': subcategory,
        'availableUnits': availableUnits,
        'defaultUnit': defaultUnit,
        'defaultQuantity': defaultQuantity,
      };
}
