import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pj1/models/budget/budget.dart';
import 'package:pj1/models/budget/budget_item.dart';
import 'package:pj1/models/budget/price_history.dart';
import 'package:pj1/services/price_history_service.dart';
import 'package:pj1/utils/budget_utils.dart';
import 'package:pj1/widgets/budget/unit_selector.dart';

class BudgetItemCard extends StatelessWidget {
  final BudgetItem item;
  final Map<String, String> locationNames;
  final VoidCallback? onDelete;
  final Function(String, double)? onPriceUpdate;
  final currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  final String budgetId;
  final PriceHistoryService historyService;
  final Budget budget; //

  BudgetItemCard({
    super.key,
    required this.item,
    required this.locationNames,
    this.onDelete,
    this.onPriceUpdate,
    required this.budgetId,
    required this.historyService,
    required this.budget,
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
                      // Prevenir múltiplas chamadas
                      if (unit != item.unit || quantity != item.quantity) {
                        // Atualizar preços para a nova unidade
                        final oldUnit = item.unit;
                        for (var entry in item.prices.entries) {
                          final convertedPrice = BudgetUtils.convertUnit(
                            item.prices[entry.key]!,
                            oldUnit,
                            unit,
                          );
                          if (onPriceUpdate != null) {
                            onPriceUpdate!(entry.key, convertedPrice);
                          }
                        }

                        // Atualizar a unidade e quantidade do item
                        item.unit = unit;
                        item.quantity = quantity;
                      }
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
                  ...locationNames.entries.map(
                    (entry) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            Expanded(child: Text(entry.value)),
                            SizedBox(
                              width: 100,
                              // Substituir o TextFormField pelo _buildPriceInput
                              child: _buildPriceInput(
                                entry.key,
                                item.prices[entry.key],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPriceInput(String locationId, double? currentPrice) {
    final debouncer = Debouncer(milliseconds: 500);
    final controller = TextEditingController(
      text: currentPrice?.toString() ?? '',
    );

    return TextFormField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: const InputDecoration(
        prefix: Text('R\$ '),
        isDense: true,
      ),
      onChanged: (value) {
        debouncer.run(() {
          final newPrice = double.tryParse(value);
          if (newPrice != null && newPrice != currentPrice) {
            print('Atualizando preço:');
            print('Local: $locationId');
            print('De: $currentPrice');
            print('Para: $newPrice');
            onPriceUpdate?.call(locationId, newPrice);
          }
        });
      },
    );
  }

  // No BudgetItemCard, após o método _buildPriceInput
  void _showHistory(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height:
              MediaQuery.of(context).size.height * 0.8, // Aumentado para 80%
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                'Comparativo de Preços',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Table(
                      border: TableBorder.all(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                      columnWidths: {
                        0: const FixedColumnWidth(100), // Item
                        for (var i = 0; i < locationNames.length; i++)
                          i + 1: const FixedColumnWidth(85), // Locais
                        locationNames.length + 1:
                            const FixedColumnWidth(85), // Melhor Local
                        locationNames.length + 2:
                            const FixedColumnWidth(85), // Melhor Preço
                      },
                      children: [
                        // Cabeçalho
                        TableRow(
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .surfaceContainerHighest,
                          ),
                          children: [
                            _buildTableCell('Item', isHeader: true),
                            ...locationNames.entries.map((entry) =>
                                _buildTableCell(entry.value, isHeader: true)),
                            _buildTableCell('Melhor Local',
                                isHeader: true, isGreen: true),
                            _buildTableCell('Melhor Preço',
                                isHeader: true, isGreen: true),
                          ],
                        ),
                        // Linhas para todos os itens do orçamento
                        ...budget.items.map((budgetItem) => TableRow(
                              children: [
                                _buildTableCell(budgetItem.name),
                                ...locationNames.entries.map((entry) {
                                  final price =
                                      budgetItem.prices[entry.key] ?? 0;
                                  return _buildTableCell(
                                    currencyFormat.format(price),
                                    isGreen: price == budgetItem.bestPrice,
                                  );
                                }),
                                _buildTableCell(
                                  locationNames[budgetItem.bestPriceLocation] ??
                                      'N/A',
                                  isGreen: true,
                                ),
                                _buildTableCell(
                                  currencyFormat.format(budgetItem.bestPrice),
                                  isGreen: true,
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Fechar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTableCell(String text,
      {bool isHeader = false, bool isGreen = false}) {
    return Container(
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : null,
          color: isGreen ? Colors.green : null,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
