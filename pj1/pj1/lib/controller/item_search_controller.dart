import 'package:flutter/material.dart';
import 'package:pj1/models/budget/budget_item.dart';

class ItemSearchController extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  final List<BudgetItem> items;
  List<BudgetItem> filteredItems = [];
  BudgetItem? selectedItem;

  ItemSearchController(this.items) {
    searchController.addListener(_filterItems);
  }

  void _filterItems() {
    if (searchController.text.isEmpty) {
      filteredItems = [];
    } else {
      filteredItems = items
          .where((item) => item.name
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void selectItem(BudgetItem item) {
    selectedItem = item;
    searchController.text = item.name;
    notifyListeners();
  }

  void clear() {
    searchController.clear();
    selectedItem = null;
    filteredItems.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
