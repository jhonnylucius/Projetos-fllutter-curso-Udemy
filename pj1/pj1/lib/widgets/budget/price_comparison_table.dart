import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pj1/models/budget/budget.dart';

class PriceComparisonTable extends StatelessWidget {
  final Budget budget;
  final currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  PriceComparisonTable({
    Key? key,
    required this.budget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tabela Comparativa de Preços',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              DataTable(
                columns: [
                  const DataColumn(label: Text('Item')),
                  ...budget.locations.map(
                    (location) => DataColumn(label: Text(location.name)),
                  ),
                ],
                rows: budget.items.map((item) {
                  return DataRow(
                    cells: [
                      DataCell(Text(item.name)),
                      ...budget.locations.map(
                        (location) => DataCell(
                          Text(
                            currencyFormat.format(
                              item.prices[location.id] ?? 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
