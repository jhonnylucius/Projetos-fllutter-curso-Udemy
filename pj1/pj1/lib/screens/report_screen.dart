import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ReportScreen extends StatefulWidget {
  final User user;
  const ReportScreen({super.key, required this.user});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String selectedType = 'expenses';
  String selectedMonth = '01/2025';
  String? selectedExpenseType;
  String? selectedIncomeType;
  List<dynamic> reportData = [];
  double totalValue = 0.0;

  final List<String> _tiposDespesa = [
    'Todas',
    'Obrigatória Anual',
    'Obrigatória Mensal',
    'Imprevisto',
    'Avulsa/Desnecessária'
  ];

  final List<String> _tiposReceita = ['Todas', 'Mensal', 'Anual', 'Esporádica'];

  final List<String> _meses = [
    'Todas',
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
    '12/2026'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Relatórios'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: const Color.fromARGB(255, 245, 160, 245),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    DropdownButtonFormField<String>(
                      value: selectedType,
                      decoration: InputDecoration(
                        labelText: 'Tipo de Relatório',
                        border: OutlineInputBorder(),
                      ),
                      items: [
                        DropdownMenuItem(
                            value: 'expenses', child: Text('Receitas')),
                        DropdownMenuItem(
                            value: 'costs', child: Text('Despesas')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedType = value!;
                          selectedExpenseType = null;
                          selectedIncomeType = null;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    if (selectedType == 'costs')
                      DropdownButtonFormField<String>(
                        value: selectedExpenseType ?? _tiposDespesa[0],
                        decoration: InputDecoration(
                          labelText: 'Tipo de Despesa',
                          border: OutlineInputBorder(),
                        ),
                        items: _tiposDespesa.map((tipo) {
                          return DropdownMenuItem(
                              value: tipo, child: Text(tipo));
                        }).toList(),
                        onChanged: (value) =>
                            setState(() => selectedExpenseType = value),
                      ),
                    if (selectedType == 'expenses')
                      DropdownButtonFormField<String>(
                        value: selectedIncomeType ?? _tiposReceita[0],
                        decoration: InputDecoration(
                          labelText: 'Tipo de Receita',
                          border: OutlineInputBorder(),
                        ),
                        items: _tiposReceita.map((tipo) {
                          return DropdownMenuItem(
                              value: tipo, child: Text(tipo));
                        }).toList(),
                        onChanged: (value) =>
                            setState(() => selectedIncomeType = value),
                      ),
                    SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: selectedMonth,
                      decoration: InputDecoration(
                        labelText: 'Mês',
                        border: OutlineInputBorder(),
                      ),
                      items: _meses.map((mes) {
                        return DropdownMenuItem(value: mes, child: Text(mes));
                      }).toList(),
                      onChanged: (value) =>
                          setState(() => selectedMonth = value!),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => generateReport(),
                      child: Text('Gerar Relatório'),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Card(
                margin: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Relatório de ${selectedType == "expenses" ? "Receitas" : "Despesas"}\n'
                        '${selectedType == "costs" ? "Tipo: ${selectedExpenseType ?? 'Todas'}" : "Tipo: ${selectedIncomeType ?? 'Todas'}"}\n'
                        'Período: $selectedMonth',
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: reportData.length,
                        itemBuilder: (context, index) {
                          final item = reportData[index];
                          return ListTile(
                            leading: CircleAvatar(
                              child: Text('${index + 1}'),
                            ),
                            title: Text(
                                '${item['data']} - R\$ ${item['preco'].toStringAsFixed(2)}'),
                            subtitle: Text(selectedType == 'expenses'
                                ? '${item['descricaoDaReceita'] ?? ''} (${item['tipoReceita'] ?? ''})'
                                : '${item['descricaoDaDespesa'] ?? ''} (${item['tipoDespesa'] ?? ''})'),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Total: R\$ ${totalValue.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
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
      Query query = FirebaseFirestore.instance.collection(collection);

      if (selectedType == 'costs' &&
          selectedExpenseType != null &&
          selectedExpenseType != 'Todas') {
        query = query.where('tipoDespesa', isEqualTo: selectedExpenseType);
      }

      if (selectedType == 'expenses' &&
          selectedIncomeType != null &&
          selectedIncomeType != 'Todas') {
        query = query.where('tipoReceita', isEqualTo: selectedIncomeType);
      }

      QuerySnapshot querySnapshot = await query.orderBy('data').get();

      double total = 0.0;
      final data = querySnapshot.docs.where((doc) {
        if (selectedMonth == 'Todas') return true;

        String docData = (doc.data() as Map<String, dynamic>)['data'] as String;
        String monthYear = docData.substring(3); // Pega mm/yyyy
        return monthYear == selectedMonth;
      }).map((doc) {
        Map<String, dynamic> docData = doc.data() as Map<String, dynamic>;
        total += (docData['preco'] ?? 0.0);
        return docData;
      }).toList();

      Logger().i('Documentos encontrados: ${data.length}');
      Logger().i('Total calculado: $total');

      setState(() {
        reportData = data;
        totalValue = total;
      });
    } catch (e) {
      Logger().e('Erro ao gerar relatório: $e');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Erro ao gerar relatório: $e')));
    }
  }
}
