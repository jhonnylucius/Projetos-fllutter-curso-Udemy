import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pj1/models/budget/budget_item.dart';
import 'package:pj1/models/budget/price_history.dart';
import 'package:pj1/services/price_history_service.dart';
import 'package:pj1/utils/budget_utils.dart';
import 'package:pj1/utils/price_history_dialog.dart';
import 'package:pj1/widgets/budget/unit_selector.dart';

class BudgetItemCard extends StatelessWidget {
  final BudgetItem item;
  final Map<String, String> locationNames;
  final VoidCallback? onDelete;
  final Function(String, double)? onPriceUpdate;
  final currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  final String budgetId;
  final PriceHistoryService historyService;

  BudgetItemCard({
    super.key,
    required this.item,
    required this.locationNames,
    this.onDelete,
    this.onPriceUpdate,
    required this.budgetId,
    required this.historyService,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(item.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Melhor preço: ${currencyFormat.format(item.bestPrice)}',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            if (item.unit !=
                'un') // Só mostra preço por unidade para itens mensuráveis
              Text(
                'Preço por unidade: ${currencyFormat.format(BudgetUtils.calculatePricePerUnit(
                  item.bestPrice,
                  item.quantity,
                  item.unit,
                ))} / ${item.unit}',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            StreamBuilder<List<PriceHistory>>(
              stream: historyService.getSignificantVariations(budgetId),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const SizedBox.shrink();

                final variations =
                    snapshot.data!.where((h) => h.itemId == item.id).toList();

                if (variations.isEmpty) return const SizedBox.shrink();

                return Text(
                  'Variação significativa detectada!',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 12,
                  ),
                );
              },
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.history),
              onPressed: () => _showHistory(context),
            ),
            if (onDelete != null)
              IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: onDelete,
              ),
          ],
        ),
        children: [
          if (onPriceUpdate != null) ...[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Seletor de unidades
                  UnitSelector(
                    initialUnit: item.unit,
                    initialQuantity: item.quantity,
                    onUnitChanged: (unit, quantity) {
                      // Atualiza os preços com a nova unidade
                      for (var entry in item.prices.entries) {
                        final convertedPrice = BudgetUtils.convertUnit(
                          item.prices[entry.key]!,
                          item.unit,
                          unit,
                        );
                        onPriceUpdate!(entry.key, convertedPrice);
                      }

                      // Atualiza a unidade do item
                      item.unit = unit;
                      item.quantity = quantity;
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Preços por Local:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Lista de preços por localização
                  ...locationNames.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Expanded(child: Text(entry.value)),
                          SizedBox(
                            width: 100,
                            child: TextFormField(
                              initialValue: item.prices[entry.key]?.toString(),
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                prefix: Text('R\$ '),
                                isDense: true,
                              ),
                              onChanged: (value) {
                                final price = double.tryParse(value) ?? 0;
                                onPriceUpdate!(entry.key, price);
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _showHistory(BuildContext context) async {
    // Carregar histórico
    final history =
        await historyService.getItemPriceHistory(budgetId, item.id).first;

    if (context.mounted) {
      showDialog(
        context: context,
        builder: (context) => PriceHistoryDialog(
          history: history,
          itemName: item.name,
          locationName: locationNames[item.bestPriceLocation] ?? 'Desconhecido',
        ),
      );
    }
  }
}
