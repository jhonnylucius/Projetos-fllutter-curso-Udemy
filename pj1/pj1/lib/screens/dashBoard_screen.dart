import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:pj1/models/costs.dart';
import 'package:pj1/models/expenses.dart';

class DashBoardScreen extends StatefulWidget {
  final String user;

  const DashBoardScreen({super.key, required this.user});

  @override
  DashBoardScreenState createState() => DashBoardScreenState();
}

class DashBoardScreenState extends State<DashBoardScreen> {
  List<Costs> listCosts = [];
  List<Expenses> listExpenses = [];
  double totalCosts = 0.0;
  double totalExpenses = 0.0;
  double averageCosts = 0.0;
  double averageExpenses = 0.0;
  double saldo = 0.0;
  int selectedMonth = DateTime.now().month; // Mês atual como padrão
  List<String> monthList = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro'
  ];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> costsSnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(widget.user)
              .collection('costs')
              .get();
      QuerySnapshot<Map<String, dynamic>> expensesSnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(widget.user)
              .collection('expenses')
              .get();

      setState(() {
        listCosts =
            costsSnapshot.docs.map((doc) => Costs.fromMap(doc.data())).toList();
        listExpenses = expensesSnapshot.docs
            .map((doc) => Expenses.fromMap(doc.data()))
            .toList();

        totalCosts = listCosts.fold(0.0, (sum, item) => sum + item.preco);
        totalExpenses = listExpenses.fold(0.0, (sum, item) => sum + item.preco);

        averageCosts =
            listCosts.isNotEmpty ? totalCosts / listCosts.length : 0.0;
        averageExpenses =
            listExpenses.isNotEmpty ? totalExpenses / listExpenses.length : 0.0;

        saldo = totalExpenses - totalCosts;

        Logger().i('Dados carregados com sucesso');
        Logger().i('Total de Despesas: $totalCosts');
        Logger().i('Total de Receitas: $totalExpenses');
        Logger().i('Saldo: $saldo');
      });
    } catch (e) {
      Logger().e('Erro ao carregar dados: $e');
    }
  }

  // Função para filtrar receitas por mês
  List<Expenses> filterExpensesByMonth(int month) {
    return listExpenses.where((expense) {
      DateTime expenseDate = DateFormat('dd/MM/yyyy')
          .parse(expense.data); // Adapte o formato se necessário
      return expenseDate.month == month;
    }).toList();
  }

  // Função para filtrar despesas por mês
  List<Costs> _filterCostsByMonth(int month) {
    return listCosts.where((cost) {
      DateTime costDate = DateFormat('dd/MM/yyyy')
          .parse(cost.data); // Adapte o formato se necessário
      return costDate.month == month;
    }).toList();
  }

  // Função para calcular o total de receitas por tipo
  Map<String, double> _calculateExpensesByType(List<Expenses> expenses) {
    Map<String, double> expensesByType = {};
    for (var expense in expenses) {
      expensesByType[expense.tipoReceita] =
          (expensesByType[expense.tipoReceita] ?? 0) + expense.preco;
    }
    return expensesByType;
  }

  // Função para calcular o total de despesas por tipo
  Map<String, double> _calculateCostsByType(List<Costs> costs) {
    Map<String, double> costsByType = {};
    for (var cost in costs) {
      costsByType[cost.tipoDespesa] =
          (costsByType[cost.tipoDespesa] ?? 0) + cost.preco;
    }
    return costsByType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    _buildInfoCard(),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Receitas Totais e por Tipo (Anual)',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    _buildPieChart(listExpenses, 'Receitas Anuais'),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0), // Ajustado padding
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Despesas Totais e por Tipo de despesa',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            // Adicionado Container para decoração
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1,
                              ),
                            ),
                            child: DropdownButton<int>(
                              value: selectedMonth,
                              underline: Container(), // Remove a linha padrão
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              onChanged: (int? newValue) {
                                setState(() {
                                  selectedMonth = newValue!;
                                });
                              },
                              items: monthList.asMap().entries.map((entry) {
                                return DropdownMenuItem<int>(
                                  value: entry.key + 1,
                                  child: Text(entry.value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _buildPieChart(
                        _filterCostsByMonth(selectedMonth), 'Despesas Mensais'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard() {
    return Card(
      margin: const EdgeInsets.all(14),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total de Despesas: \$${totalCosts.toStringAsFixed(2)}'),
            Text('Total de Receitas: \$${totalExpenses.toStringAsFixed(2)}'),
            Text('Média de Despesas: \$${averageCosts.toStringAsFixed(2)}'),
            Text('Média de Receitas: \$${averageExpenses.toStringAsFixed(2)}'),
            Text('Saldo: \$${saldo.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }

  Widget _buildPieChart(List<dynamic> items, String title) {
    Map<String, double> dataByType;
    if (title.contains('Receitas')) {
      dataByType = _calculateExpensesByType(items.cast<Expenses>());
    } else {
      dataByType = _calculateCostsByType(items.cast<Costs>());
    }

    List<Color> colors = [
      Colors.blue,
      Colors.green,
      Colors.red,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.lime,
      Colors.pink,
      Colors.amber,
      Colors.cyan,
    ];
    return GestureDetector(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  children: [
                    AppBar(
                      title: Text(title),
                      automaticallyImplyLeading: false,
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildChartContentPie(dataByType, colors),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Card(
        margin: const EdgeInsets.all(14),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(
                  height: 200,
                  child: _buildChartContentPie(dataByType, colors)),
              const Text(
                'Clique aqui e segure para visualizar maior',
                style: TextStyle(
                    fontSize: 12, color: Color.fromARGB(255, 132, 17, 143)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChartContentPie(
      Map<String, double> dataByType, List<Color> colors) {
    List<PieChartSectionData> pieChartSections = [];
    int colorIndex = 0;
    double totalValue = dataByType.values.fold(0, (sum, value) => sum + value);

    dataByType.forEach((type, value) {
      double percentage = (value / totalValue) * 100;
      pieChartSections.add(
        PieChartSectionData(
          color: colors[colorIndex % colors.length],
          value: value,
          title: '${percentage.toStringAsFixed(1)}%',
          radius: 50,
          titleStyle: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      );
      colorIndex++;
    });

    return Row(
      children: [
        Expanded(
          child: PieChart(
            PieChartData(
                sections: pieChartSections,
                centerSpaceRadius: 30,
                borderData: FlBorderData(show: false),
                sectionsSpace: 0,
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    //Implementar a lógica de toque aqui, caso seja necessário
                  },
                )),
          ),
        ),
        Expanded(
            child: ListView.builder(
          shrinkWrap: true,
          itemCount: dataByType.length,
          itemBuilder: (context, index) {
            final type = dataByType.keys.toList()[index];
            final value = dataByType.values.toList()[index];
            return ListTile(
              leading: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors[index % colors.length])),
              title: Text('$type : ${value.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 14)),
            );
          },
        )),
      ],
    );
  }
}
