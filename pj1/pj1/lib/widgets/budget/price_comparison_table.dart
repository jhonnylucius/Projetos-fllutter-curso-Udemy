import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pj1/models/budget/budget.dart';
import 'package:pj1/models/budget/budget_item.dart';
import 'package:share_plus/share_plus.dart';

class PriceComparisonTable extends StatefulWidget {
  final Budget budget;

  const PriceComparisonTable({
    super.key,
    required this.budget,
  });

  @override
  State<PriceComparisonTable> createState() => _PriceComparisonTableState();
}

class _PriceComparisonTableState extends State<PriceComparisonTable> {
  final GlobalKey _screenShotKey = GlobalKey();
  final currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  final ScrollController _horizontalController = ScrollController();
  final ScrollController _verticalController = ScrollController();

  List<BudgetItem> _getSortedItems() {
    final groupedItems = <String, List<BudgetItem>>{};

    for (var item in widget.budget.items) {
      if (!groupedItems.containsKey(item.bestPriceLocation)) {
        groupedItems[item.bestPriceLocation] = [];
      }
      groupedItems[item.bestPriceLocation]!.add(item);
    }

    groupedItems.forEach((_, items) {
      items.sort((a, b) => a.name.compareTo(b.name));
    });

    final sortedItems = <BudgetItem>[];
    for (var location in widget.budget.locations) {
      if (groupedItems.containsKey(location.id)) {
        sortedItems.addAll(groupedItems[location.id]!);
      }
    }

    return sortedItems;
  }

  @override
  Widget build(BuildContext context) {
    final sortedItems = _getSortedItems();

    return Card(
      child: RepaintBoundary(
        key: _screenShotKey,
        child: SingleChildScrollView(
          controller: _verticalController,
          child: SingleChildScrollView(
            controller: _horizontalController,
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Comparativo de Preços',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.share),
                        tooltip: 'Compartilhar tabela',
                        onPressed: () => _shareTable(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Table(
                    border: TableBorder.all(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                    columnWidths: {
                      0: const FixedColumnWidth(120),
                      for (var i = 0; i < widget.budget.locations.length; i++)
                        i + 1: const FixedColumnWidth(100),
                      widget.budget.locations.length + 1:
                          const FixedColumnWidth(120),
                      widget.budget.locations.length + 2:
                          const FixedColumnWidth(120),
                    },
                    children: [
                      TableRow(
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .surfaceContainerHighest,
                        ),
                        children: [
                          _buildHeaderCell('Item'),
                          ...widget.budget.locations
                              .map((loc) => _buildHeaderCell(loc.name)),
                          _buildHeaderCell('Melhor Local', isGreen: true),
                          _buildHeaderCell('Melhor Preço', isGreen: true),
                        ],
                      ),
                      ...sortedItems.map((item) {
                        final bestLocation = widget.budget.locations.firstWhere(
                            (loc) => loc.id == item.bestPriceLocation);

                        return TableRow(
                          children: [
                            _buildCell(item.name),
                            ...widget.budget.locations.map((loc) => _buildCell(
                                  currencyFormat
                                      .format(item.prices[loc.id] ?? 0),
                                  isHighlighted:
                                      item.prices[loc.id] == item.bestPrice,
                                )),
                            _buildCell(bestLocation.name, isGreen: true),
                            _buildCell(
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

  Future<void> _shareTable(BuildContext context) async {
    try {
      // 1. Ajustar scroll para capturar tudo
      final currentOffsetH = _horizontalController.offset;
      final currentOffsetV = _verticalController.offset;

      // Voltar para o início
      await _horizontalController.animateTo(
        0,
        duration: const Duration(milliseconds: 100),
        curve: Curves.linear,
      );
      await _verticalController.animateTo(
        0,
        duration: const Duration(milliseconds: 100),
        curve: Curves.linear,
      );

      // 2. Aguardar renderização
      await Future.delayed(const Duration(milliseconds: 100));

      // 3. Capturar imagem
      final boundary = _screenShotKey.currentContext?.findRenderObject()
          as RenderRepaintBoundary?;
      if (boundary == null) return;

      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ImageByteFormat.png);

      // 4. Restaurar posição do scroll
      await _horizontalController.animateTo(
        currentOffsetH,
        duration: const Duration(milliseconds: 100),
        curve: Curves.linear,
      );
      await _verticalController.animateTo(
        currentOffsetV,
        duration: const Duration(milliseconds: 100),
        curve: Curves.linear,
      );

      if (byteData != null) {
        final directory = await getTemporaryDirectory();
        final imagePath = '${directory.path}/tabela_precos.png';
        final imgFile = File(imagePath);
        await imgFile.writeAsBytes(byteData.buffer.asUint8List());

        await Share.shareXFiles(
          [XFile(imagePath)],
          text: 'Comparativo de Preços',
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao compartilhar: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _horizontalController.dispose();
    _verticalController.dispose();
    super.dispose();
  }
}
