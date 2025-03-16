import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
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

    // Calcular totais para a tabela
    final locationTotals = <String, double>{};
    final bestPriceTotal = widget.budget.items.fold<double>(
      0,
      (sum, item) => sum + item.bestPrice,
    );

    // Calcular total para cada local
    for (var location in widget.budget.locations) {
      locationTotals[location.id] = widget.budget.items.fold<double>(
        0,
        (sum, item) => sum + (item.prices[location.id] ?? 0),
      );
    }

    return Card(
      child: RepaintBoundary(
        key: _screenShotKey,
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            controller: _verticalController,
            scrollDirection: Axis.vertical,
            // Remover physics para permitir scroll
            child: SingleChildScrollView(
              controller: _horizontalController,
              scrollDirection: Axis.horizontal,
              // Remover physics para permitir scroll
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
                        0: const FixedColumnWidth(
                            50), // Nova coluna para número de ordem
                        1: const FixedColumnWidth(
                            120), // Coluna do item (ajustada do índice 0 para 1)
                        for (var i = 0; i < widget.budget.locations.length; i++)
                          i + 2: const FixedColumnWidth(
                              100), // Ajustado do índice i + 1 para i + 2
                        widget.budget.locations.length + 2:
                            const FixedColumnWidth(120),
                        widget.budget.locations.length + 3:
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
                            _buildHeaderCell(
                                'Nº'), // Nova coluna de número de ordem
                            _buildHeaderCell('Item'),
                            ...widget.budget.locations
                                .map((loc) => _buildHeaderCell(loc.name)),
                            _buildHeaderCell('Melhor Local', isGreen: true),
                            _buildHeaderCell('Melhor Preço', isGreen: true),
                          ],
                        ),
                        // Na construção da TableRow dos itens, modifique a chamada do número de ordem
                        ...sortedItems.asMap().entries.map((entry) {
                          final index = entry.key + 1;
                          final item = entry.value;
                          final bestLocation = widget.budget.locations
                              .firstWhere(
                                  (loc) => loc.id == item.bestPriceLocation);

                          return TableRow(
                            children: [
                              _buildCell('$index',
                                  isOrderNumber:
                                      true), // Número de ordem centralizado
                              _buildCell(item.name),
                              ...widget.budget.locations
                                  .map((loc) => _buildCell(
                                        currencyFormat
                                            .format(item.prices[loc.id] ?? 0),
                                        isHighlighted: item.prices[loc.id] ==
                                            item.bestPrice,
                                      )),
                              _buildCell(bestLocation.name, isGreen: true),
                              _buildCell(
                                currencyFormat.format(item.bestPrice),
                                isGreen: true,
                              ),
                            ],
                          );
                        }),
                        // Na linha de totais
                        TableRow(
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .surfaceContainerHighest,
                          ),
                          children: [
                            _buildHeaderCell(
                                '-'), // Célula vazia para a coluna de número de ordem
                            _buildHeaderCell('Totais'),
                            ...widget.budget.locations.map(
                              (loc) => _buildHeaderCell(
                                currencyFormat
                                    .format(locationTotals[loc.id] ?? 0),
                              ),
                            ),
                            _buildHeaderCell('-'),
                            _buildHeaderCell(
                              currencyFormat.format(bestPriceTotal),
                              isGreen: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String text, {bool isGreen = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      alignment: Alignment.center,
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
      {bool isHighlighted = false,
      bool isGreen = false,
      bool isOrderNumber = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      alignment: isOrderNumber ? Alignment.center : Alignment.centerLeft,
      constraints: const BoxConstraints(),
      child: Text(
        text,
        style: TextStyle(
          color: isHighlighted || isGreen ? Colors.green : null,
          fontWeight: isOrderNumber || isHighlighted || isGreen
              ? FontWeight.bold
              : null,
        ),
        textAlign: isOrderNumber ? TextAlign.center : TextAlign.left,
      ),
    );
  }

  Future<void> _shareTable(BuildContext context) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(child: CircularProgressIndicator());
        },
      );

      // Criar documento PDF
      final pdf = pw.Document();

      // Dados da tabela
      final headers = [
        'Item',
        ...widget.budget.locations.map((loc) => loc.name),
        'Melhor Local',
        'Melhor Preço',
      ];

      final rows = _getSortedItems().map((item) {
        final bestLocation = widget.budget.locations
            .firstWhere((loc) => loc.id == item.bestPriceLocation);

        return [
          item.name,
          ...widget.budget.locations
              .map((loc) => currencyFormat.format(item.prices[loc.id] ?? 0)),
          bestLocation.name,
          currencyFormat.format(item.bestPrice),
        ];
      }).toList();

      // Calcular totais por local
      final locationTotals = <String, double>{};
      final bestPriceTotal = widget.budget.items.fold<double>(
        0,
        (sum, item) => sum + item.bestPrice,
      );

      // Calcular total para cada local
      for (var location in widget.budget.locations) {
        locationTotals[location.id] = widget.budget.items.fold<double>(
          0,
          (sum, item) => sum + (item.prices[location.id] ?? 0),
        );
      }

      // Adicionar linha de totais aos rows
      rows.add([
        'Totais',
        ...widget.budget.locations
            .map((loc) => currencyFormat.format(locationTotals[loc.id] ?? 0)),
        '-',
        currencyFormat.format(bestPriceTotal),
      ]);

      pdf.addPage(
        pw.Page(
          pageFormat:
              PdfPageFormat.standard, // Formato paisagem para mais espaço
          margin: const pw.EdgeInsets.all(20),
          build: (context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Título
                pw.Center(
                  child: pw.Text(
                    'Relatório de Preços - ${widget.budget.title}',
                    style: pw.TextStyle(
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
                pw.SizedBox(height: 10),

                // Card de Resumo (centralizado e com largura limitada)
                pw.Center(
                  child: pw.Container(
                    width: 400, // Largura fixa para o card
                    padding: const pw.EdgeInsets.all(16),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.grey300),
                      borderRadius:
                          const pw.BorderRadius.all(pw.Radius.circular(8)),
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          'Resumo Geral',
                          style: pw.TextStyle(
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.SizedBox(height: 8),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildPdfSummaryItem(
                              'Total Original',
                              currencyFormat
                                  .format(widget.budget.summary.totalOriginal),
                              PdfColors.grey700,
                            ),
                            _buildPdfSummaryItem(
                              'Melhor Preço',
                              currencyFormat
                                  .format(widget.budget.summary.totalOptimized),
                              PdfColors.green700,
                            ),
                            _buildPdfSummaryItem(
                              'Economia',
                              currencyFormat
                                  .format(widget.budget.summary.savings),
                              PdfColors.blue700,
                            ),
                          ],
                        ),
                        pw.SizedBox(height: 8),
                        pw.Text(
                          'Economia de ${(widget.budget.summary.savings / widget.budget.summary.totalOriginal * 100).toStringAsFixed(1)}%',
                          style: pw.TextStyle(
                            fontSize: 14,
                            color: PdfColors.blue700,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                pw.SizedBox(height: 16),

                // Tabela
                pw.Table(
                  border: pw.TableBorder.all(color: PdfColors.grey400),
                  columnWidths: {
                    0: const pw.FixedColumnWidth(120),
                    for (var i = 0; i < widget.budget.locations.length; i++)
                      i + 1: const pw.FixedColumnWidth(100),
                    widget.budget.locations.length + 1:
                        const pw.FixedColumnWidth(120),
                    widget.budget.locations.length + 2:
                        const pw.FixedColumnWidth(120),
                  },
                  children: [
                    // Cabeçalho
                    pw.TableRow(
                      decoration: const pw.BoxDecoration(
                        color: PdfColors.grey300,
                      ),
                      children: headers
                          .map((header) => pw.Container(
                                padding: const pw.EdgeInsets.all(8),
                                child: pw.Text(
                                  header,
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ))
                          .toList(),
                    ),
                    // Linhas de dados
                    ...rows.asMap().entries.map(
                      (entry) {
                        final isLastRow = entry.key == rows.length - 1;
                        final rowData = entry.value;

                        return pw.TableRow(
                          decoration: isLastRow
                              ? const pw.BoxDecoration(color: PdfColors.grey200)
                              : null,
                          children: rowData.asMap().entries.map(
                            (cell) {
                              final isPrice = cell.key >
                                  0; // Todas as colunas exceto a primeira são preços
                              final isBestPrice = cell.key ==
                                  rowData.length - 1; // Última coluna
                              final isBestLocation = cell.key ==
                                  rowData.length - 2; // Penúltima coluna

                              // Verificar se é o melhor preço em uma coluna de preço
                              final isBestPriceInLocation = isPrice &&
                                  !isLastRow &&
                                  cell.value ==
                                      rows[entry.key][rowData.length -
                                          1]; // Compara com o melhor preço da linha

                              return pw.Container(
                                padding: const pw.EdgeInsets.all(8),
                                child: pw.Text(
                                  cell.value,
                                  style: pw.TextStyle(
                                    fontWeight:
                                        isLastRow || isBestPriceInLocation
                                            ? pw.FontWeight.bold
                                            : null,
                                    color: isBestPrice || isBestPriceInLocation
                                        ? PdfColors.green700
                                        : isBestLocation && !isLastRow
                                            ? PdfColors.green900
                                            : null,
                                  ),
                                  textAlign: pw.TextAlign.center,
                                ),
                              );
                            },
                          ).toList(),
                        );
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      );

      // Salvar PDF
      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/resumo_orcamento.pdf');
      await file.writeAsBytes(await pdf.save());

      if (context.mounted) {
        Navigator.pop(context); // Remove loading
        await Share.shareXFiles(
          [XFile(file.path)],
          text: 'Tabela Comparativa de Preços',
        );
      }
    } catch (e) {
      print('Erro ao compartilhar: $e');
      if (context.mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao compartilhar: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  // Adicione esta função auxiliar no final da classe
  pw.Widget _buildPdfSummaryItem(String label, String value, PdfColor color) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          label,
          style: const pw.TextStyle(
            fontSize: 10,
            color: PdfColors.grey600,
          ),
        ),
        pw.SizedBox(height: 4),
        pw.Text(
          value,
          style: pw.TextStyle(
            fontSize: 14,
            fontWeight: pw.FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
