import 'package:flutter/material.dart';
import 'package:pj1/models/budget/budget_item.dart';
import 'package:pj1/models/budget/item_template.dart';
import 'package:pj1/services/item_template_service.dart';
import 'package:uuid/uuid.dart';

class AddItemForm extends StatefulWidget {
  final Function(List<BudgetItem>) onItemsAdded;

  const AddItemForm({
    super.key,
    required this.onItemsAdded,
  });

  @override
  State<AddItemForm> createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = '';
  final List<ItemTemplate> _selectedItems = [];
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
      _filteredItems = ItemTemplateService.searchTemplates(
        _searchController.text,
        category: _selectedCategory,
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Dropdown de categorias
        DropdownButtonFormField<String>(
          value: _selectedCategory,
          decoration: const InputDecoration(
            labelText: 'Categoria',
            border: OutlineInputBorder(),
          ),
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
        const SizedBox(height: 16),

        // Campo de pesquisa
        TextField(
          controller: _searchController,
          decoration: InputDecoration(
            labelText: 'Pesquisar itens',
            hintText: 'Digite o nome, categoria ou subcategoria...',
            prefixIcon: const Icon(Icons.search),
            border: const OutlineInputBorder(),
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      _updateFilteredItems();
                    },
                  )
                : null,
          ),
          onChanged: (value) => _updateFilteredItems(),
        ),
        const SizedBox(height: 16),

        // Lista de itens com checkbox
        // Mostrar resultados com mais detalhes
        Expanded(
          child: _filteredItems.isEmpty
              ? const Center(
                  child: Text('Nenhum item encontrado'),
                )
              : ListView.builder(
                  itemCount: _filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = _filteredItems[index];
                    final isSelected = _selectedItems.contains(item);

                    return CheckboxListTile(
                      value: isSelected,
                      title: Text(item.name),
                      subtitle: Text(
                        '${item.subcategory ?? item.category} • ${item.defaultQuantity} ${item.defaultUnit}',
                      ),
                      secondary: isSelected
                          ? const Icon(Icons.check_circle, color: Colors.green)
                          : null,
                      onChanged: (checked) {
                        setState(() {
                          if (checked!) {
                            _selectedItems.add(item);
                          } else {
                            _selectedItems.remove(item);
                          }
                        });
                      },
                    );
                  },
                ),
        ),

        // Botões de ação
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Text(
                'Selecionados: ${_selectedItems.length}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Center(
                child: FilledButton(
                  onPressed: _selectedItems.isEmpty ? null : _addItems,
                  child: const Text('Adicionar Selecionados'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _addItems() {
    final items = _selectedItems
        .map((template) => BudgetItem(
              id: const Uuid().v4(),
              name: template.name,
              category: template.category,
              unit: template.defaultUnit,
              quantity: template.defaultQuantity,
              prices: {},
              bestPrice: 0,
              bestPriceLocation: '',
            ))
        .toList();

    widget.onItemsAdded(items);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
