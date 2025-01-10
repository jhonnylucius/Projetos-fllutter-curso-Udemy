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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _buildInfoCard(),
                _buildBarChart('Despesas por Dia', listCosts),
                _buildBarChart('Receitas por Dia', listExpenses),
              ],
            ),
          ),
        ),
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
    return Card(
      margin: EdgeInsets.all(14),
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            SizedBox(
              height: 160,
              child: BarChart(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
