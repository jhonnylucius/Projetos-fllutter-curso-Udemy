import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pj1/models/budget/budget_summary.dart';

class BudgetSummaryCard extends StatelessWidget {
  final BudgetSummary summary;
  final String title;

  const BudgetSummaryCard({
    Key? key,
    required this.summary,
    this.title = 'Resumo',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currencyFormat =
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    final savingsPercentage = summary.totalOriginal > 0
        ? (summary.savings / summary.totalOriginal) * 100
        : 0.0;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSummaryItem(
                  'Total Original',
                  currencyFormat.format(summary.totalOriginal),
                  Colors.grey[700]!,
                ),
                _buildSummaryItem(
                  'Melhor Preço',
                  currencyFormat.format(summary.totalOptimized),
                  Colors.green[700]!,
                ),
                _buildSummaryItem(
                  'Economia',
                  currencyFormat.format(summary.savings),
                  Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                'Economia de ${savingsPercentage.toStringAsFixed(1)}%',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
