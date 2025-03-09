import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pj1/models/budget/budget.dart';
import 'package:pj1/models/budget/budget_location.dart';
import 'package:pj1/services/budget_service.dart';
import 'package:pj1/utils/budget_utils.dart';
import 'package:pj1/widgets/budget/budget_summary_card.dart';
import 'package:pj1/widgets/budget/price_comparison_table.dart';
import 'package:share_plus/share_plus.dart';

class BudgetCompareScreen extends StatelessWidget {
  final Budget budget;
  final currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  final BudgetService budgetService;

  BudgetCompareScreen({
    super.key,
    required this.budget,
    required this.budgetService,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comparação - ${budget.title}'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _refreshPrices(context),
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
              _buildSavingsAnalysis(),
              const SizedBox(height: 16),
              _buildBestPricesComparison(),
              const SizedBox(height: 16),
              _buildLocationComparison(),
              const SizedBox(height: 16),
              _buildDetailedPriceTable(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'share_report', // Adicione esta linha
        onPressed: () => _shareReport(context),
        label: const Text('Compartilhar'),
        icon: const Icon(Icons.share),
      ),
    );
  }

  Widget _buildOverallSummary(BuildContext context) {
    return BudgetSummaryCard(
      summary: budget.summary,
      title: 'Resumo Geral',
    );
  }

  Widget _buildSavingsAnalysis() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Análise de Economia',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildSavingsChart(),
            const SizedBox(height: 8),
            _buildSavingsDetails(),
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
      height: 200,
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

  Widget _buildSavingsDetails() {
    final savings = budget.items.map((item) {
      final saving = item.calculateSavings();
      final percentage = item.calculateSavingsPercentage();
      return MapEntry(item, (saving, percentage));
    }).toList()
      ..sort((a, b) => b.value.$1.compareTo(a.value.$1));

    return Column(
      children: savings.map((entry) {
        return ListTile(
          title: Text(entry.key.name),
          subtitle: Text(
            'Economia: ${currencyFormat.format(entry.value.$1)}',
            style: const TextStyle(color: Colors.green),
          ),
          trailing: Text(
            '${entry.value.$2.toStringAsFixed(1)}%',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBestPricesComparison() {
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
            ...budget.items.map((item) {
              item.compareUnitPrices();
              return ListTile(
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

  Widget _buildLocationComparison() {
    final totals = BudgetUtils.calculateTotalsByLocation(budget);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Comparação por Estabelecimento',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...budget.locations.map((location) {
              final total = totals[location.id] ?? 0;
              return ListTile(
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

  Future<void> _refreshPrices(BuildContext context) async {
    try {
      // Mostrar diálogo de progresso
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Atualizando preços...'),
                ],
              ),
            ),
          ),
        ),
      );

      // Atualizar preços de cada item
      for (var item in budget.items) {
        for (var location in budget.locations) {
          // Simular delay para não sobrecarregar
          await Future.delayed(const Duration(milliseconds: 100));

          // Calcular novo preço (exemplo: variação de ±5%)
          final currentPrice = item.prices[location.id] ?? 0;
          if (currentPrice > 0) {
            final variation = (currentPrice * 0.05); // 5% de variação
            final newPrice =
                currentPrice + (Random().nextBool() ? variation : -variation);

            // Atualizar preço no Firebase
            await budgetService.updateItemPrice(
              budget.id,
              item.id,
              location.id,
              newPrice,
            );

            // Atualizar preço localmente
            item.prices[location.id] = newPrice;
          }
        }
        // Atualizar melhor preço do item
        item.updateBestPrice();
      }

      // Atualizar resumo do orçamento
      budget.updateSummary();

      // Fechar diálogo de progresso
      if (context.mounted) {
        Navigator.of(context).pop();
      }

      // Mostrar mensagem de sucesso
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Preços atualizados com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      // Fechar diálogo de progresso em caso de erro
      if (context.mounted) {
        Navigator.of(context).pop();
      }

      // Mostrar mensagem de erro
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao atualizar preços: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _shareReport(BuildContext context) async {
    try {
      final report = StringBuffer();

      // Cabeçalho
      report.writeln('📊 Relatório de Comparação - ${budget.title}');
      report.writeln(
          'Data: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}\n');

      // Resumo
      report.writeln('💰 Resumo Geral:');
      report.writeln(
          'Total Original: ${currencyFormat.format(budget.summary.totalOriginal)}');
      report.writeln(
          'Melhor Cenário: ${currencyFormat.format(budget.summary.totalOptimized)}');
      report.writeln(
          'Economia Total: ${currencyFormat.format(budget.summary.savings)}');

      // Detalhes por item
      report.writeln('\n📝 Detalhes por Item:');
      for (var item in budget.items) {
        report.writeln('\n${item.name}:');
        report.writeln(
            '  Melhor preço: ${currencyFormat.format(item.bestPrice)}');
        report.writeln(
            '  Economia: ${currencyFormat.format(item.calculateSavings())}');
        report.writeln('  Local: ${budget.locations.firstWhere(
              (loc) => loc.id == item.bestPriceLocation,
              orElse: () => BudgetLocation(
                id: '',
                name: 'N/A',
                address: '',
                priceDate: DateTime.now(),
              ),
            ).name}');
      }

      // Compartilhar
      await Share.share(
        report.toString(),
        subject: 'Relatório de Economia - ${budget.title}',
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao compartilhar: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
