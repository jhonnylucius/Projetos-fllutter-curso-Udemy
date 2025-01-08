import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
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
  List<Expenses> listHours = [];
  double totalCosts = 0.0;
  double totalHours = 0.0;
  double averageCosts = 0.0;
  double averageHours = 0.0;
  double surplus = 0.0;
  double deficit = 0.0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      // Pega os dados de custos do Firestore
      QuerySnapshot<Map<String, dynamic>> costsSnapshot =
          await FirebaseFirestore.instance
              .collection('${widget.userId}_costs')
              .get();
      listCosts =
          costsSnapshot.docs.map((doc) => Costs.fromMap(doc.data())).toList();

      // Pega os dados de horas do Firestore
      QuerySnapshot<Map<String, dynamic>> hoursSnapshot =
          await FirebaseFirestore.instance.collection(widget.userId).get();
      listHours = hoursSnapshot.docs
          .map((doc) => Expenses.fromMap(doc.data()))
          .toList();

      // Calcula os totais, médias, superavit e deficit
      totalCosts = listCosts.fold(0.0, (sum, item) => sum + item.preco);
      totalHours = listHours.fold(0.0, (sum, item) => sum + item.preco);
      averageCosts = totalCosts / listCosts.length;
      averageHours = totalHours / listHours.length;
      surplus = totalHours - totalCosts;
      deficit = totalCosts - totalHours;

      setState(() {});
    } catch (e) {
      print('Erro ao buscar dados: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha((0.92 * 255).toInt()),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Dashboard Financeiro',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text('Total de Receitas: R\$ $totalHours'),
                Text('Total de Despesas: R\$ $totalCosts'),
                Text('Média de Receitas: R\$ $averageHours'),
                Text('Média de Despesas: R\$ $averageCosts'),
                Text('Superavit: R\$ $surplus'),
                Text('Deficit: R\$ $deficit'),
                SizedBox(height: 16),
                Container(
                  height: 300,
                  child: LineChart(
                    _createData(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  LineChartData _createData() {
    // Cria os dados para o gráfico
    List<FlSpot> costsData = listCosts.map((cost) {
      DateTime date = DateTime.parse(cost.data);
      return FlSpot(date.millisecondsSinceEpoch.toDouble(), cost.preco);
    }).toList();

    List<FlSpot> hoursData = listHours.map((hour) {
      DateTime date = DateTime.parse(hour.data);
      return FlSpot(date.millisecondsSinceEpoch.toDouble(), hour.preco);
    }).toList();

    return LineChartData(
      lineBarsData: [
        LineChartBarData(
          spots: costsData,
          isCurved: true,
          color: Colors.red,
          barWidth: 2,
          isStrokeCapRound: true,
          belowBarData: BarAreaData(show: false),
        ),
        LineChartBarData(
          spots: hoursData,
          isCurved: true,
          color: Colors.green,
          barWidth: 2,
          isStrokeCapRound: true,
          belowBarData: BarAreaData(show: false),
        ),
      ],
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              DateTime date =
                  DateTime.fromMillisecondsSinceEpoch(value.toInt());
              return Text('${date.day}/${date.month}');
            },
          ),
        ),
      ),
      borderData: FlBorderData(show: true),
    );
  }
}
