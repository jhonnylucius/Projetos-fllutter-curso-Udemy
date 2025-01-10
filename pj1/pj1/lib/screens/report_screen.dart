import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  final User user;
  const ReportScreen({super.key, required this.user});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String selectedType = 'expenses'; // 'expenses' ou 'costs'
  String selectedMonth = '01/2025';
  List<dynamic> reportData = [];
  List<Map<String, dynamic>> savedReports = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Relatórios'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fundoRelatorio.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Filtros
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // Dropdown tipo
                  DropdownButton<String>(
                    value: selectedType,
                    items: [
                      DropdownMenuItem(
                          value: 'expenses', child: Text('Receitas')),
                      DropdownMenuItem(value: 'costs', child: Text('Despesas')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedType = value!;
                      });
                    },
                  ),
                  SizedBox(width: 16),
                  // Dropdown mês
                  DropdownButton<String>(
                    value: selectedMonth,
                    items: [
                      '01/2025',
                      '02/2025',
                      '03/2025',
                      '04/2025',
                      '05/2025',
                      '06/2025',
                      '07/2025',
                      '08/2025',
                      '09/2025',
                      '10/2025',
                      '11/2025',
                      '12/2025',
                      '01/2026',
                      '02/2026',
                      '03/2026',
                      '04/2026',
                      '05/2026',
                      '06/2026',
                      '07/2026',
                      '08/2026',
                      '09/2026',
                      '10/2026',
                      '11/2026',
                      '12/2026',
                      // Adicione mais meses conforme necessário
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedMonth = value!;
                      });
                    },
                  ),
                  // Botão Gerar Relatório
                  ElevatedButton(
                    onPressed: () => generateReport(),
                    child: Text('Gerar Relatório'),
                  ),
                ],
              ),
            ),
            // Lista de Relatórios
            Expanded(
              child: ListView.builder(
                itemCount: reportData.length,
                itemBuilder: (context, index) {
                  final item = reportData[index];
                  return Card(
                    child: ListTile(
                      title: Text('Data: ${item['data']}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Valor: R\$ ${item['preco'].toStringAsFixed(2)}'),
                          if (selectedType == 'expenses')
                            Text('Descrição: ${item['descricaoDaReceita']}'),
                          if (selectedType == 'costs')
                            Text('Descrição: ${item['descricaoDaDespesa']}'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => deleteReport(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void generateReport() async {
    final collection = selectedType == 'expenses'
        ? '${widget.user.uid}_expenses'
        : '${widget.user.uid}_costs';

    try {
      QuerySnapshot<
          Map<String,
              dynamic>> querySnapshot = await FirebaseFirestore.instance
          .collection(collection)
          .where('data', isGreaterThanOrEqualTo: selectedMonth)
          .where('data',
              isLessThan:
                  '${int.parse(selectedMonth.split('/')[0]) + 1}/${selectedMonth.split('/')[1]}')
          .orderBy('data')
          .get();

      setState(() {
        reportData = querySnapshot.docs.map((doc) => doc.data()).toList();
      });

      // Salvar relatório
      final reportRef = FirebaseFirestore.instance
          .collection('${widget.user.uid}_reports')
          .doc();

      await reportRef.set({
        'type': selectedType,
        'month': selectedMonth,
        'data': reportData,
        'createdAt': DateTime.now(),
      });
    } catch (e) {
      print('Erro ao gerar relatório: $e');
    }
  }

  void deleteReport(int index) async {
    try {
      await FirebaseFirestore.instance
          .collection('${widget.user.uid}_reports')
          .doc(reportData[index]['id'])
          .delete();

      setState(() {
        reportData.removeAt(index);
      });
    } catch (e) {
      print('Erro ao excluir relatório: $e');
    }
  }
}
