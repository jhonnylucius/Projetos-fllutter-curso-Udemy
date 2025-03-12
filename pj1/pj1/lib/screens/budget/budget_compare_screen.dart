import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pj1/controller/screen_shot_controller.dart';
import 'package:pj1/models/budget/budget.dart';
import 'package:pj1/models/budget/budget_location.dart';
import 'package:pj1/services/budget_service.dart';
import 'package:pj1/utils/budget_utils.dart';
import 'package:pj1/widgets/budget/budget_summary_card.dart';
import 'package:pj1/widgets/budget/price_comparison_table.dart';
import 'package:screenshot/screenshot.dart';

class BudgetCompareScreen extends StatelessWidget {
  final Budget budget;
  final currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  final BudgetService budgetService;
  final CustomScreenshotController screenshotController =
      CustomScreenshotController();

  BudgetCompareScreen({
    super.key,
    required this.budget,
    required this.budgetService,
  });

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController.screenshotController,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Comparação - ${budget.title}'),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                '/home',
                (route) => false,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildOverallSummary(context),
                const SizedBox(height: 16),
                _buildSavingsAnalysis(context),
                const SizedBox(height: 16),
                _buildBestPricesComparison(context),
                const SizedBox(height: 16),
                _buildLocationComparison(context),
                const SizedBox(height: 16),
                _buildDetailedPriceTable(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOverallSummary(BuildContext context) {
    return BudgetSummaryCard(
      summary: budget.summary,
      title: 'Resumo Geral',
    );
  }

  Widget _buildSavingsAnalysis(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 8),
                const Text(
                  'Análise de Economia',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildSavingsChart(),
            const SizedBox(height: 8),
            _buildSavingsDetails(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSavingsChart() {
    final savings = budget.items.map((item) {
      final saving = item.calculateSavings();
      return MapEntry(item.name, saving);
    }).toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: savings.map((entry) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  width: 50,
                  height: entry.value / 2,
                  color: Colors.green,
                ),
                const SizedBox(height: 8),
                Text(entry.key),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSavingsDetails(BuildContext context) {
    final savings = budget.items.map((item) {
      final saving = item.calculateSavings();
      final percentage = item.calculateSavingsPercentage();
      return MapEntry(item, (saving, percentage));
    }).toList()
      ..sort((a, b) => b.value.$1.compareTo(a.value.$1));

    return Column(
      children: savings.asMap().entries.map((entry) {
        final index = entry.key + 1; // Número de ordem
        final item = entry.value;
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            radius: 12,
            child: Text(
              '$index',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(item.key.name),
          subtitle: Text(
            'Economia: ${currencyFormat.format(item.value.$1)}',
            style: const TextStyle(color: Colors.green),
          ),
          trailing: Text(
            '${item.value.$2.toStringAsFixed(1)}%',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBestPricesComparison(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Melhores Preços por Item',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...budget.items.asMap().entries.map((entry) {
              final index = entry.key + 1;
              final item = entry.value;
              item.compareUnitPrices();
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  radius: 12,
                  child: Text(
                    '$index',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(item.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Melhor preço: ${currencyFormat.format(item.bestPrice)}',
                      style: const TextStyle(color: Colors.green),
                    ),
                    Text(
                      'Preço por ${item.unit}: ${currencyFormat.format(
                        item.getPricePerUnit(),
                      )}',
                    ),
                  ],
                ),
                trailing: Text(
                  budget.locations
                      .firstWhere(
                        (loc) => loc.id == item.bestPriceLocation,
                        orElse: () => BudgetLocation(
                          id: '',
                          name: 'N/A',
                          address: '',
                          priceDate: DateTime.now(),
                        ),
                      )
                      .name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationComparison(BuildContext context) {
    final totals = BudgetUtils.calculateTotalsByLocation(budget);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 8),
                const Text(
                  'Comparação p/ Estabelecimento',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            ...budget.locations.asMap().entries.map((entry) {
              final index = entry.key + 1;
              final location = entry.value;
              final total = totals[location.id] ?? 0;
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  radius: 12,
                  child: Text(
                    '$index',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(location.name),
                subtitle: Text(location.address),
                trailing: Text(
                  currencyFormat.format(total),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailedPriceTable() {
    return PriceComparisonTable(budget: budget);
  }
}
