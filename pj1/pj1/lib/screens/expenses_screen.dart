import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pj1/components/menu.dart';
import 'package:pj1/models/expenses.dart'; // Importar modelo Expenses
import 'package:uuid/uuid.dart';

class ExpensesScreen extends StatefulWidget {
  final User user;
  const ExpensesScreen({
    super.key,
    required this.user,
  });

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  List<Expenses> listExpenses = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(user: widget.user),
      appBar: AppBar(
        title: Text('AgendaPRO'),
        elevation: 2,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showFormModal(),
        icon: const Icon(Icons.add),
        label: const Text('Add Receitas'),
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
                  .withAlpha((0.1 * 255).toInt()),
              Colors.white,
            ],
          ),
        ),
        child: listExpenses.isEmpty
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
                      'Registre suas Receitas',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              )
            : ListView(
                padding: EdgeInsets.only(left: 4, right: 4),
                children: List.generate(listExpenses.length, (index) {
                  Expenses model = listExpenses[index];
                  return Dismissible(
                    key: ValueKey<Expenses>(model),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 12),
                      color: Colors.red,
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (direction) {
                      remove(model);
                    },
                    child: Card(
                      elevation: 2,
                      child: Column(
                        children: [
                          ListTile(
                            onLongPress: () {
                              showFormModal(model: model);
                            },
                            onTap: () {},
                            leading: Icon(Icons.list_alt_rounded, size: 56),
                            title: Text("Data: ${model.data}"),
                            subtitle: Text(model.descricaoDaReceita ?? ''),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
      ),
    );
  }

  showFormModal({Expenses? model}) {
    String title = "Adicionar";
    String confirmationButton = "Salvar";
    String SkipButton = "Cancelar";

    TextEditingController dataController = TextEditingController();
    final dataMaskFormatter = MaskTextInputFormatter(mask: '##/##/####');
    TextEditingController precoController = TextEditingController();
    final precoMaskFormatter =
        MaskTextInputFormatter(mask: '', filter: {"#": RegExp(r'[0-9]')});
    TextEditingController descricaoDaReceitaController =
        TextEditingController();
    TextEditingController tipoReceitaController = TextEditingController();
    final tipoReceitaMaskFormatter = MaskTextInputFormatter(mask: '');

    if (model != null) {
      title = "Editando";
      dataController.text = model.data;
      tipoReceitaController.text = model.tipoReceita ?? '';
      descricaoDaReceitaController.text = model.descricaoDaReceita ?? '';
      precoController.text = model.preco.toString();
      confirmationButton = "Atualizar";
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 32,
            right: 32,
            top: 32,
          ),
          child: Container(
            child: ListView(
              shrinkWrap: true,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                TextFormField(
                  controller: dataController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    hintText: '01/01/2024',
                    labelText: 'Data',
                  ),
                  inputFormatters: [dataMaskFormatter],
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: precoController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Valor da Receita.',
                    labelText: '100.00',
                  ),
                  inputFormatters: [precoMaskFormatter],
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: descricaoDaReceitaController,
                  decoration: InputDecoration(
                    hintText: 'Qual a receita que você recebeu?',
                    labelText: 'Descrição',
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: tipoReceitaController,
                  decoration: InputDecoration(
                    hintText: 'Essa receita é mensal, anual ou esporádica?',
                    labelText: 'Tipo de Receita',
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
                      child: Text(SkipButton),
                    ),
                    SizedBox(width: 16),
                    TextButton(
                      onPressed: () async {
                        Expenses expenses = Expenses(
                          id: const Uuid().v1(),
                          data: dataController.text,
                          preco: double.tryParse(precoController.text) ?? 0.0,
                          descricaoDaReceita: descricaoDaReceitaController.text,
                          tipoReceita: tipoReceitaController.text,
                        );

                        if (model != null) {
                          expenses.id = model.id;
                        }

                        await firestore
                            .collection('${widget.user.uid}_expenses')
                            .doc(expenses.id)
                            .set(expenses.toMap());

                        if (mounted) {
                          await refresh();
                          Navigator.pop(context);
                        }
                      },
                      child: Text(confirmationButton),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> refresh([dynamic snapshot]) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firestore.collection('${widget.user.uid}_expenses').get();

      setState(() {
        listExpenses = querySnapshot.docs
            .map((doc) => Expenses.fromMap(doc.data()))
            .toList();
      });
    } catch (e) {
      print('Erro ao atualizar lista: $e');
    }
  }

  Future<void> remove(Expenses expenses) async {
    await firestore
        .collection('${widget.user.uid}_expenses')
        .doc(expenses.id)
        .delete();
    refresh();
  }
}
