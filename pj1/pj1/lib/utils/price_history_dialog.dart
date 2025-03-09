import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pj1/models/budget/price_history.dart';
import 'package:pj1/widgets/budget/price_history_chart.dart';

class PriceHistoryDialog extends StatelessWidget {
  final List<PriceHistory> history;
  final String itemName;
  final String locationName;
  final currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  PriceHistoryDialog({
    super.key,
    required this.history,
    required this.itemName,
    required this.locationName,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Gráfico
              PriceHistoryChart(
                history: history,
                itemName: itemName,
                locationName: locationName,
              ),
              const Divider(height: 32),
              // Lista de variações
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: history.length,
                itemBuilder: (context, index) {
                  final record = history[index];
                  final isPositive = record.variation > 0;

                  return ListTile(
                    leading: Icon(
                      isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                      color: isPositive ? Colors.red : Colors.green,
                    ),
                    title: Text(currencyFormat.format(record.price)),
                    subtitle: Text(
                      DateFormat('dd/MM/yyyy HH:mm').format(record.date),
                    ),
                    trailing: Text(
                      '${record.variation.abs().toStringAsFixed(1)}%',
                      style: TextStyle(
                        color: isPositive ? Colors.red : Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
