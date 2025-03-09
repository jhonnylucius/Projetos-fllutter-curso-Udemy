import 'package:flutter/material.dart';
import 'package:pj1/data/default_items.dart'; // Adicione este import
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
  final _quantityController =
      TextEditingController(text: '1.0'); // Adicionar controller
  String _selectedCategory = 'Alimentos';
  String _selectedUnit = 'un'; // Adicionar unidade padrão

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
          // Adicionar campos de quantidade e unidade
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TextFormField(
                  controller: _quantityController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Quantidade',
                    hintText: 'Ex: 1.5',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe a quantidade';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Quantidade inválida';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _selectedUnit,
                  decoration: const InputDecoration(
                    labelText: 'Unidade',
                  ),
                  items: [
                    ...defaultUnits['Peso']!.map((unit) => DropdownMenuItem(
                          value: unit,
                          child: Text(unit),
                        )),
                    ...defaultUnits['Volume']!.map((unit) => DropdownMenuItem(
                          value: unit,
                          child: Text(unit),
                        )),
                    const DropdownMenuItem(value: 'un', child: Text('un')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _selectedUnit = value;
                      });
                    }
                  },
                ),
              ),
            ],
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
        unit: _selectedUnit,
        quantity: double.tryParse(_quantityController.text) ?? 1.0,
        prices: {},
        bestPrice: 0,
        bestPriceLocation: '',
      );

      widget.onItemAdded(item);
      Navigator.of(context).pop(); // Fecha o diálogo após adicionar
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    super.dispose();
  }
}
