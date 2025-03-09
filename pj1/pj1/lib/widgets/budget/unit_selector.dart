import 'package:flutter/material.dart';
import 'package:pj1/data/default_items.dart';

class UnitSelector extends StatefulWidget {
  final String initialUnit;
  final double initialQuantity;
  final Function(String unit, double quantity) onUnitChanged;

  const UnitSelector({
    Key? key,
    required this.initialUnit,
    required this.initialQuantity,
    required this.onUnitChanged,
  }) : super(key: key);

  @override
  State<UnitSelector> createState() => _UnitSelectorState();
}

class _UnitSelectorState extends State<UnitSelector> {
  late String _selectedUnit;
  late TextEditingController _quantityController;

  @override
  void initState() {
    super.initState();
    _selectedUnit = widget.initialUnit;
    _quantityController = TextEditingController(
      text: widget.initialQuantity.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
            onChanged: (value) {
              final quantity = double.tryParse(value) ?? 0;
              widget.onUnitChanged(_selectedUnit, quantity);
            },
          ),
        ),
        const SizedBox(width: 8),
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
              ...defaultUnits['Unidade']!.map((unit) => DropdownMenuItem(
                    value: unit,
                    child: Text(unit),
                  )),
            ],
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedUnit = value;
                });
                final quantity = double.tryParse(_quantityController.text) ?? 0;
                widget.onUnitChanged(value, quantity);
              }
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }
}
