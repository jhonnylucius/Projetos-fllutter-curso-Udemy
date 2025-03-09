import 'package:flutter/material.dart';
import 'package:pj1/models/budget/budget_item.dart';
import 'package:uuid/uuid.dart';

class AddItemForm extends StatefulWidget {
  final Function(BudgetItem) onItemAdded;

  const AddItemForm({
    Key? key,
    required this.onItemAdded,
  }) : super(key: key);

  @override
  State<AddItemForm> createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  String _selectedCategory = 'Alimentos';

  final _categories = [
    'Alimentos',
    'Limpeza',
    'Higiene',
    'Bebidas',
    'Outros',
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Nome do Item',
              hintText: 'Ex: Arroz',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, insira o nome do item';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: _selectedCategory,
            decoration: const InputDecoration(
              labelText: 'Categoria',
            ),
            items: _categories.map((category) {
              return DropdownMenuItem(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedCategory = value!;
              });
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Adicionar Item'),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final item = BudgetItem(
        id: const Uuid().v4(),
        name: _nameController.text.trim(),
        category: _selectedCategory,
        prices: {},
        bestPriceLocation: '',
        bestPrice: 0,
      );

      widget.onItemAdded(item);
      _nameController.clear();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
