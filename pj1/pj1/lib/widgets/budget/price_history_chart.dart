import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pj1/models/budget/price_history.dart';

class PriceHistoryChart extends StatelessWidget {
  final List<PriceHistory> history;
  final String itemName;
  final String locationName;

  const PriceHistoryChart({
    Key? key,
    required this.history,
    required this.itemName,
    required this.locationName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) {
      return const Center(
        child: Text('Sem histórico de preços'),
      );
    }

    return Column(
      children: [
        Text(
          'Histórico de Preços - $itemName',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          locationName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: true),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      if (value.toInt() >= 0 &&
                          value.toInt() < history.length) {
                        return Text(
                          DateFormat('dd/MM')
                              .format(history[value.toInt()].date),
                          style: const TextStyle(fontSize: 10),
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(show: true),
              lineBarsData: [
                LineChartBarData(
                  spots: history
                      .asMap()
                      .entries
                      .map((e) => FlSpot(
                            e.key.toDouble(),
                            e.value.price,
                          ))
                      .toList(),
                  isCurved: true,
                  color: Theme.of(context).colorScheme.primary,
                  barWidth: 3,
                  dotData: const FlDotData(show: true),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
