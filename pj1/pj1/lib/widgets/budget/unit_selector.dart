import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pj1/data/default_items.dart';

class UnitSelector extends StatefulWidget {
  final String initialUnit;
  final double initialQuantity;
  final Function(String, double) onUnitChanged;

  const UnitSelector({
    super.key,
    required this.initialUnit,
    required this.initialQuantity,
    required this.onUnitChanged,
  });

  @override
  State<UnitSelector> createState() => _UnitSelectorState();
}

class _UnitSelectorState extends State<UnitSelector> {
  late TextEditingController _quantityController;
  late String _currentUnit;
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _quantityController = TextEditingController(
      text: widget.initialQuantity.toString(),
    );
    _currentUnit = widget.initialUnit;
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  void _updateValues(String? unit, String? quantity) {
    if (unit != null) {
      _currentUnit = unit;
    }

    final newQuantity = double.tryParse(
          quantity ?? _quantityController.text,
        ) ??
        widget.initialQuantity;

    _debouncer.run(() {
      widget.onUnitChanged(_currentUnit, newQuantity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: TextFormField(
                controller: _quantityController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Quantidade',
                  hintText: 'Ex: 1.5',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => _updateValues(null, value),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: DropdownButtonFormField<String>(
                value: _currentUnit,
                decoration: const InputDecoration(
                  labelText: 'Unidade',
                  border: OutlineInputBorder(),
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
                onChanged: (value) => _updateValues(value, null),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
