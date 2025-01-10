import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pj1/components/menu.dart';
import 'package:pj1/models/costs.dart';
import 'package:uuid/uuid.dart';

class CostsScreen extends StatefulWidget {
  final User user;
  const CostsScreen({
    super.key,
    required this.user,
  });

  @override
  State<CostsScreen> createState() => _CostsScreenState();
}

class _CostsScreenState extends State<CostsScreen> {
  List<Costs> listCosts = []; // Lista para armazenar as despesas
  FirebaseFirestore firestore =
      FirebaseFirestore.instance; // Instância do Firestore

  @override
  void initState() {
    super.initState();
    refresh(); // Atualiza a lista de despesas ao inicializar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(user: widget.user), // Menu lateral
      appBar: AppBar(
        title: Text('GestorFinanceiro'),
        elevation: 2,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            showFormModal(), // Exibe o formulário para adicionar despesas
        icon: const Icon(Icons.add),
        label: const Text(
          'Add Despesas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 255, 255, 255)
                  .withAlpha((0.1 * 255).toInt()), // Cor com transparência
              Colors.white,
            ],
          ),
        ),
        child: listCosts.isEmpty
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/Icon-192.png',
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Vamos começar?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 251, 251, 252),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Registre suas Despesas',
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 129, 18, 151),
                      ),
                    ),
                  ],
                ),
              )
            : ListView(
                padding: EdgeInsets.only(left: 4, right: 4),
                children: List.generate(
                  listCosts
                      .length, // Cria uma lista de widgets baseada em despesas
                  (index) {
                    Costs model = listCosts[index];
                    return Dismissible(
                      key: ValueKey<Costs>(model), // Identificador único
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 12),
                        color: Colors.red, // Fundo vermelho ao deslizar
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (direction) {
                        remove(model); // Remove o item ao deslizar
                      },
                      child: Card(
                        elevation: 2,
                        child: Column(
                          children: [
                            ListTile(
                              onLongPress: () {
                                showFormModal(model: model); // Edita a despesa
                              },
                              leading: Icon(Icons.list_alt_rounded, size: 56),
                              title: Text("Data: ${model.data}"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Preço: ${model.preco.toStringAsFixed(2)}"),
                                  Text(
                                    "Descrição: ${model.descricaoDaDespesa != null && model.descricaoDaDespesa!.isNotEmpty ? model.descricaoDaDespesa : 'Sem descrição'}",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2025),
      lastDate: DateTime(2026, 12),
      locale: const Locale('pt', 'BR'),
    );
    if (picked != null) {
      String formattedDate =
          "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
      controller.text = formattedDate;
    }
  }

  showFormModal({Costs? model}) {
    String confirmationButton = "Salvar";
    String skipButton = "Cancelar";

    TextEditingController dataController = TextEditingController();
    TextEditingController precoController = TextEditingController();
    TextEditingController descricaoDaDespesaController =
        TextEditingController();
    TextEditingController tipoDespesaController = TextEditingController();

    if (model != null) {
      dataController.text = model.data;
      tipoDespesaController.text = model.tipoDespesa;
      descricaoDaDespesaController.text = model.descricaoDaDespesa ?? '';
      precoController.text = model.preco.toString();
      confirmationButton = "Atualizar";
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: dataController,
                decoration: InputDecoration(
                  hintText: '01/01/2025',
                  labelText: 'Data',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context, dataController),
                  ),
                ),
                readOnly: true,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: precoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Valor da Despesa.',
                  labelText: '100.00',
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: descricaoDaDespesaController,
                decoration: InputDecoration(
                  hintText: 'Qual a despesa que você pagou?',
                  labelText: 'Descrição',
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: tipoDespesaController,
                decoration: InputDecoration(
                  hintText: 'Essa despesa é mensal, anual ou esporádica?',
                  labelText: 'Tipo da Despesa',
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(skipButton),
                  ),
                  SizedBox(width: 16),
                  TextButton(
                    onPressed: () async {
                      Costs costs = Costs(
                        id: const Uuid().v1(),
                        data: dataController.text,
                        preco: double.tryParse(precoController.text) ?? 0.0,
                        descricaoDaDespesa: descricaoDaDespesaController.text,
                        tipoDespesa: tipoDespesaController.text,
                      );

                      if (model != null) {
                        costs.id = model.id;
                      }

                      await firestore
                          .collection('${widget.user.uid}_costs')
                          .doc(costs.id)
                          .set(costs.toMap());

                      await refresh();
                      Navigator.pop(context);
                    },
                    child: Text(confirmationButton),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> refresh([dynamic snapshot]) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firestore.collection('${widget.user.uid}_costs').get();

      setState(() {
        listCosts =
            querySnapshot.docs.map((doc) => Costs.fromMap(doc.data())).toList();
      });
    } catch (e) {
      Logger().e('Erro ao atualizar lista: $e');
    }
  }

  Future<void> remove(Costs costs) async {
    await firestore
        .collection('${widget.user.uid}_costs')
        .doc(costs.id)
        .delete();
    refresh();
  }
}
