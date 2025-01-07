import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pj1/models/hour.dart';

class DashBoardScreen extends StatefulWidget {
  final String userId;

  const DashBoardScreen({super.key, required this.userId});

  @override
  DashBoardScreenState createState() => DashBoardScreenState();
}

class DashBoardScreenState extends State<DashBoardScreen> {
  List<Hour> listHours = [];
  double totalEarnings = 0;
  double averageEarnings = 0;
  double totalHours = 0;
  double averageHours = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection(widget.userId).get();

    List<Hour> temp = [];
    double earnings = 0;
    double hours = 0;

    for (var doc in querySnapshot.docs) {
      Hour hour = Hour.fromMap(doc.data());
      temp.add(hour);
      earnings += hour.preco;
      hours += hour.minutos / 60;
    }

    setState(() {
      listHours = temp;
      totalEarnings = earnings;
      averageEarnings = earnings / temp.length;
      totalHours = hours;
      averageHours = hours / temp.length;
    });
  }

  List<FlSpot> getSpots() {
    List<FlSpot> spots = [];
    for (int i = 0; i < listHours.length; i++) {
      spots.add(FlSpot(i.toDouble(), listHours[i].preco));
    }
    return spots;
  }

  List<FlSpot> getHourSpots() {
    List<FlSpot> spots = [];
    for (int i = 0; i < listHours.length; i++) {
      spots.add(FlSpot(i.toDouble(), listHours[i].minutos / 60));
    }
    return spots;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Resumo do Mês',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 16),
              Text('Total de Ganhos: R\$${totalEarnings.toStringAsFixed(2)}'),
              Text('Média de Ganhos: R\$${averageEarnings.toStringAsFixed(2)}'),
              Text(
                  'Total de Horas Trabalhadas: ${totalHours.toStringAsFixed(2)} horas'),
              Text(
                  'Média de Horas Trabalhadas: ${averageHours.toStringAsFixed(2)} horas'),
              SizedBox(height: 32),
              Text(
                'Dias x Horas Trabalhadas',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 300,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 24, // Máximo de 24 horas
                    titlesData: FlTitlesData(
                      show: true,
                      topTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            '${value.toInt()}h',
                            style: TextStyle(fontSize: 10),
                          );
                        },
                      )),
                    ),
                    barGroups: List.generate(
                      listHours.length,
                      (index) => BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                            toY: listHours[index].minutos / 60,
                            width: 8,
                            color: Colors
                                .primaries[index % Colors.primaries.length],
                            backDrawRodData:
                                BackgroundBarChartRodData(show: false),
                          ),
                        ],
                        showingTooltipIndicators: [0],
                      ),
                    ),
                    barTouchData: BarTouchData(
                      enabled: true,
                      touchTooltipData: BarTouchTooltipData(
                        tooltipRoundedRadius: 8,
                        tooltipBorder: BorderSide(color: Colors.grey),
                        tooltipPadding: EdgeInsets.all(8),
                        tooltipMargin: 8,
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          return BarTooltipItem(
                            '${groupIndex + 1}',
                            TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawHorizontalLine: true,
                      drawVerticalLine: true,
                      horizontalInterval: 4,
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
