import 'package:flutter/material.dart';
import 'package:pj1/models/budget/item_template.dart';
import 'package:pj1/services/item_template_service.dart';

class ItemSelector extends StatefulWidget {
  final Function(List<ItemTemplate>) onItemsSelected;

  const ItemSelector({
    super.key,
    required this.onItemsSelected,
  });

  @override
  State<ItemSelector> createState() => _ItemSelectorState();
}

class _ItemSelectorState extends State<ItemSelector> {
  String _selectedCategory = '';
  final List<ItemTemplate> _selectedItems = [];
  final TextEditingController _searchController = TextEditingController();
  List<ItemTemplate> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _selectedCategory = ItemTemplateService.getCategories().first;
    _updateFilteredItems();
  }

  void _updateFilteredItems() {
    if (_searchController.text.isEmpty) {
      _filteredItems =
          ItemTemplateService.getTemplatesByCategory(_selectedCategory);
    } else {
      _filteredItems =
          ItemTemplateService.searchTemplates(_searchController.text);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Dropdown de categorias
        DropdownButtonFormField<String>(
          value: _selectedCategory,
          items: ItemTemplateService.getCategories().map((category) {
            return DropdownMenuItem(
              value: category,
              child: Text(category),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                _selectedCategory = value;
                _updateFilteredItems();
              });
            }
          },
        ),
        // Campo de pesquisa
        TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            labelText: 'Pesquisar itens',
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (value) => _updateFilteredItems(),
        ),
        // Lista de itens
        Expanded(
          child: ListView.builder(
            itemCount: _filteredItems.length,
            itemBuilder: (context, index) {
              final item = _filteredItems[index];
              final isSelected = _selectedItems.contains(item);

              return CheckboxListTile(
                value: isSelected,
                title: Text(item.name),
                subtitle: Text('${item.defaultQuantity} ${item.defaultUnit}'),
                onChanged: (checked) {
                  setState(() {
                    if (checked!) {
                      _selectedItems.add(item);
                    } else {
                      _selectedItems.remove(item);
                    }
                    widget.onItemsSelected(_selectedItems);
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
