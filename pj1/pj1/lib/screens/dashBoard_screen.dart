import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pj1/models/costs.dart';
import 'package:pj1/models/expenses.dart';

class DashBoardScreen extends StatefulWidget {
  final String userId;

  const DashBoardScreen({super.key, required this.userId});

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
  double surplus = 0.0;
  double deficit = 0.0;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> costsSnapshot =
          await FirebaseFirestore.instance
              .collection('${widget.userId}_costs')
              .get();
      QuerySnapshot<Map<String, dynamic>> expensesSnapshot =
          await FirebaseFirestore.instance
              .collection('${widget.userId}_expenses')
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

        surplus = totalExpenses - totalCosts;
        deficit = totalCosts - totalExpenses;
      });
    } catch (e) {
      Logger().e('Erro ao carregar dados: $e');
    }
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
            decoration: BoxDecoration(
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Despesas por Dia',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    _buildBarChart('', listCosts),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Receitas por Dia',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    _buildBarChart('', listExpenses),
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
      margin: EdgeInsets.all(14),
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total de Despesas: \$${totalCosts.toStringAsFixed(2)}'),
            Text('Total de Receitas: \$${totalExpenses.toStringAsFixed(2)}'),
            Text('Média de Despesas: \$${averageCosts.toStringAsFixed(2)}'),
            Text('Média de Receitas: \$${averageExpenses.toStringAsFixed(2)}'),
            Text('Superávit: \$${surplus.toStringAsFixed(2)}'),
            Text('Déficit: \$${deficit.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart(String title, List<dynamic> data) {
    return GestureDetector(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  children: [
                    AppBar(
                      title: Text(title),
                      automaticallyImplyLeading: false,
                      actions: [
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildChartContent(data),
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
        margin: EdgeInsets.all(14),
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 140, child: _buildChartContent(data)),
              Text(
                'Clique aqui e segure para visualizar maior',
                style: TextStyle(
                    fontSize: 12,
                    color: const Color.fromARGB(255, 132, 17, 143)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChartContent(List<dynamic> data) {
    return BarChart(
      BarChartData(
        barGroups: data.map((item) {
          return BarChartGroupData(
            x: data.indexOf(item),
            barRods: [
              BarChartRodData(
                toY: item.preco,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
