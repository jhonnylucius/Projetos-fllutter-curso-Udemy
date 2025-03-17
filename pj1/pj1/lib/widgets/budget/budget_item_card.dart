import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pj1/models/budget/budget.dart';
import 'package:pj1/models/budget/budget_item.dart';
import 'package:pj1/models/budget/price_history.dart';
import 'package:pj1/services/price_history_service.dart';
import 'package:pj1/utils/budget_utils.dart';

class BudgetItemCard extends StatefulWidget {
  final BudgetItem item;
  final Map<String, String> locationNames;
  final VoidCallback? onDelete;
  final Function(String, double)? onPriceUpdate;
  final currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  final String budgetId;
  final PriceHistoryService historyService;
  final Budget budget;
  final Function(bool)? onEditingStateChange;

  BudgetItemCard({
    super.key,
    required this.item,
    required this.locationNames,
    this.onDelete,
    this.onPriceUpdate,
    required this.budgetId,
    required this.historyService,
    required this.budget,
    this.onEditingStateChange,
  });

  @override
  State<BudgetItemCard> createState() => _BudgetItemCardState();
}

class _BudgetItemCardState extends State<BudgetItemCard> {
  bool _isEditing = false;
  final Map<String, TextEditingController> _priceControllers = {};
  bool _hasChanges = false;
  late TextEditingController _quantityController;
  late String _selectedUnit;
  final currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    for (var entry in widget.locationNames.entries) {
      _priceControllers[entry.key] = TextEditingController(
        text: widget.item.prices[entry.key]?.toString() ?? '',
      );
    }
    _quantityController = TextEditingController(
      text: widget.item.quantity.toString(),
    );
    _selectedUnit = widget.item.unit;
  }

  @override
  void dispose() {
    for (var controller in _priceControllers.values) {
      controller.dispose();
    }
    _quantityController.dispose();
    super.dispose();
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
      widget.onEditingStateChange?.call(_isEditing); // Notifica mudança
      if (!_isEditing) {
        for (var entry in widget.locationNames.entries) {
          _priceControllers[entry.key]?.text =
              widget.item.prices[entry.key]?.toString() ?? '';
        }
        _quantityController.text = widget.item.quantity.toString();
        _selectedUnit = widget.item.unit;
      }
      _hasChanges = false;
    });
  }

  void _saveChanges() {
    if (!_hasChanges) return;

    final newQuantity =
        double.tryParse(_quantityController.text) ?? widget.item.quantity;
    final oldUnit = widget.item.unit;
    final newUnit = _selectedUnit;

    if (oldUnit != newUnit) {
      for (var entry in _priceControllers.entries) {
        final currentPrice =
            double.tryParse(_priceControllers[entry.key]!.text) ??
                widget.item.prices[entry.key]!;
        final convertedPrice = BudgetUtils.convertUnit(
          currentPrice,
          oldUnit,
          newUnit,
        );
        widget.onPriceUpdate?.call(entry.key, convertedPrice);
      }
    } else {
      for (var entry in _priceControllers.entries) {
        final newPrice = double.tryParse(_priceControllers[entry.key]!.text);
        if (newPrice != null && newPrice != widget.item.prices[entry.key]) {
          widget.onPriceUpdate?.call(entry.key, newPrice);
        }
      }
    }

    setState(() {
      widget.item.unit = newUnit;
      widget.item.quantity = newQuantity;
      _isEditing = false;
      _hasChanges = false;
    });
  }

  Widget _buildUnitSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _quantityController,
                enabled: _isEditing,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Quantidade',
                  isDense: true,
                ),
                onChanged: (value) {
                  setState(() {
                    _hasChanges = true;
                  });
                },
              ),
            ),
            const SizedBox(width: 16),
            DropdownButton<String>(
              value: _selectedUnit,
              onChanged: _isEditing
                  ? (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _selectedUnit = newValue;
                          _hasChanges = true;
                        });
                      }
                    }
                  : null,
              items: const [
                DropdownMenuItem(value: 'un', child: Text('Unidade')),
                DropdownMenuItem(value: 'kg', child: Text('Quilograma')),
                DropdownMenuItem(value: 'g', child: Text('Grama')),
                DropdownMenuItem(value: 'L', child: Text('Litro')),
                DropdownMenuItem(value: 'ml', child: Text('Mililitro')),
                DropdownMenuItem(value: 'par', child: Text('Par')),
                DropdownMenuItem(value: 'cx', child: Text('Caixa')),
                DropdownMenuItem(value: 'pct', child: Text('Pacote')),
                DropdownMenuItem(value: 'band', child: Text('Bandeja')),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceInput(String locationId, double? currentPrice) {
    return TextFormField(
      controller: _priceControllers[locationId],
      enabled: _isEditing,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: const InputDecoration(
        prefix: Text('R\$ '),
        isDense: true,
      ),
      onChanged: (value) {
        setState(() {
          _hasChanges = true;
        });
      },
    );
  }

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
                        for (var i = 0; i < widget.locationNames.length; i++)
                          i + 1: const FixedColumnWidth(85), // Locais
                        widget.locationNames.length + 1:
                            const FixedColumnWidth(85), // Melhor Local
                        widget.locationNames.length + 2:
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
                            ...widget.locationNames.entries.map((entry) =>
                                _buildTableCell(entry.value, isHeader: true)),
                            _buildTableCell('Melhor Local',
                                isHeader: true, isGreen: true),
                            _buildTableCell('Melhor Preço',
                                isHeader: true, isGreen: true),
                          ],
                        ),
                        // Linhas para todos os itens do orçamento
                        ...widget.budget.items.map((budgetItem) => TableRow(
                              children: [
                                _buildTableCell(budgetItem.name),
                                ...widget.locationNames.entries.map((entry) {
                                  final price =
                                      budgetItem.prices[entry.key] ?? 0;
                                  return _buildTableCell(
                                    currencyFormat.format(price),
                                    isGreen: price == budgetItem.bestPrice,
                                  );
                                }),
                                _buildTableCell(
                                  widget.locationNames[
                                          budgetItem.bestPriceLocation] ??
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

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionPanelList(
        elevation: 0,
        expandedHeaderPadding: EdgeInsets.zero,
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _isExpanded = isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            isExpanded: _isExpanded,
            canTapOnHeader: true,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(widget.item.name),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.history),
                              onPressed: () => _showHistory(context),
                            ),
                            if (widget.onDelete != null)
                              IconButton(
                                icon: const Icon(Icons.delete_outline),
                                onPressed: widget.onDelete,
                              ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      'Melhor preço: ${currencyFormat.format(widget.item.bestPrice)}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    if (widget.item.unit != 'un')
                      Text(
                        'Preço por unidade: ${currencyFormat.format(BudgetUtils.calculatePricePerUnit(
                          widget.item.bestPrice,
                          widget.item.quantity,
                          widget.item.unit,
                        ))} / ${widget.item.unit}',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    Text(
                      'Locais orçados: ${widget.item.prices.values.where((price) => price > 0).length}/${widget.locationNames.length}',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                    if (widget.item.prices.values
                            .where((price) => price > 0)
                            .length ==
                        widget.locationNames.length) ...[
                      const SizedBox(height: 2),
                      const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 12,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Concluído',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                    StreamBuilder<List<PriceHistory>>(
                      stream: widget.historyService
                          .getSignificantVariations(widget.budgetId),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return const SizedBox.shrink();

                        final variations = snapshot.data!
                            .where((h) => h.itemId == widget.item.id)
                            .toList();

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
              );
            },
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildUnitSelector(),
                  const SizedBox(height: 16),
                  const Text(
                    'Preços por Local:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...widget.locationNames.entries.map(
                    (entry) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            Expanded(child: Text(entry.value)),
                            SizedBox(
                              width: 100,
                              child: _buildPriceInput(
                                entry.key,
                                widget.item.prices[entry.key],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: _toggleEdit,
                        icon: Icon(_isEditing ? Icons.cancel : Icons.edit),
                        label: Text(_isEditing ? 'Cancelar' : 'Editar'),
                      ),
                      ElevatedButton.icon(
                        onPressed: _hasChanges ? _saveChanges : null,
                        icon: const Icon(Icons.save),
                        label: const Text('Salvar'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
