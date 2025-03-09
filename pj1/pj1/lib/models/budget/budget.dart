import 'budget_item.dart';
import 'budget_location.dart';
import 'budget_summary.dart';

class Budget {
  String id;
  String title;
  DateTime date;
  List<BudgetLocation> locations;
  List<BudgetItem> items;
  BudgetSummary summary;
  String userId; // ID do usuário que criou o orçamento

  Budget({
    required this.id,
    required this.title,
    required this.date,
    required this.locations,
    required this.items,
    required this.summary,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date.toIso8601String(),
      'locations': locations.map((x) => x.toMap()).toList(),
      'items': items.map((x) => x.toMap()).toList(),
      'summary': summary.toMap(),
      'userId': userId,
    };
  }

  factory Budget.fromMap(Map<String, dynamic> map) {
    return Budget(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      date: DateTime.parse(map['date'] ?? DateTime.now().toIso8601String()),
      locations: List<BudgetLocation>.from(
        map['locations']?.map((x) => BudgetLocation.fromMap(x)) ?? [],
      ),
      items: List<BudgetItem>.from(
        map['items']?.map((x) => BudgetItem.fromMap(x)) ?? [],
      ),
      summary: BudgetSummary.fromMap(map['summary'] ?? {}),
      userId: map['userId'] ?? '',
    );
  }

  void updateSummary() {
    summary.calculateSummary(items);
  }

  void addItem(BudgetItem item) {
    items.add(item);
    updateSummary();
  }

  void removeItem(String itemId) {
    items.removeWhere((item) => item.id == itemId);
    updateSummary();
  }

  void addLocation(BudgetLocation location) {
    locations.add(location);
  }

  void removeLocation(String locationId) {
    locations.removeWhere((location) => location.id == locationId);
    // Remove preços associados a esta localização
    for (var item in items) {
      item.prices.remove(locationId);
      item.updateBestPrice();
    }
    updateSummary();
  }
}
