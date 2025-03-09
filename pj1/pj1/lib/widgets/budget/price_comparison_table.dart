import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pj1/models/budget/budget.dart';

class PriceComparisonTable extends StatelessWidget {
  final Budget budget;
  final currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  PriceComparisonTable({
    super.key,
    required this.budget,
  });

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
                'Comparativo de Preços',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Table(
                border: TableBorder.all(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
                columnWidths: {
                  0: const FixedColumnWidth(120), // Item
                  for (var i = 0; i < budget.locations.length; i++)
                    i + 1: const FixedColumnWidth(100), // Locais
                  budget.locations.length + 1:
                      const FixedColumnWidth(120), // Melhor Local
                  budget.locations.length + 2:
                      const FixedColumnWidth(120), // Melhor Preço
                },
                children: [
                  // Cabeçalho
                  TableRow(
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                    ),
                    children: [
                      _buildHeaderCell('Item'),
                      ...budget.locations
                          .map((loc) => _buildHeaderCell(loc.name)),
                      _buildHeaderCell('Melhor Local', isGreen: true),
                      _buildHeaderCell('Melhor Preço', isGreen: true),
                    ],
                  ),
                  // Linhas de dados
                  ...budget.items.map((item) {
                    final bestLocation = budget.locations
                        .firstWhere((loc) => loc.id == item.bestPriceLocation);

                    return TableRow(
                      children: [
                        _buildCell(item.name), // Item
                        ...budget.locations.map((loc) => _buildCell(
                              // Preços por local
                              currencyFormat.format(item.prices[loc.id] ?? 0),
                              isHighlighted:
                                  item.prices[loc.id] == item.bestPrice,
                            )),
                        _buildCell(
                          // Melhor local
                          bestLocation.name,
                          isGreen: true,
                        ),
                        _buildCell(
                          // Melhor preço
                          currencyFormat.format(item.bestPrice),
                          isGreen: true,
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String text, {bool isGreen = false}) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isGreen ? Colors.green : null,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildCell(String text,
      {bool isHighlighted = false, bool isGreen = false}) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(
          color: isHighlighted || isGreen ? Colors.green : null,
          fontWeight: isHighlighted || isGreen ? FontWeight.bold : null,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
