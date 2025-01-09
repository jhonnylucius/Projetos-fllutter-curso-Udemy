import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  List<Costs> listCosts = [];
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
        label: const Text(
          'Add Custos',
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
                  .withAlpha((0.1 * 255).toInt()),
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
                  listCosts.length,
                  (index) {
                    Costs model = listCosts[index];
                    return Dismissible(
                        key: ValueKey<Costs>(model),
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
                        ));
                  },
                ),
              ),
      ),
    );
  }

  showFormModal({Costs? model}) {
    String title = "Adicionar";
    String confirmationButton = "Salvar";
    String SkipButton = "Cancelar";

    TextEditingController dataController = TextEditingController();
    final dataMaskFormatter = MaskTextInputFormatter(mask: '##/##/####');
    TextEditingController precoController = TextEditingController();
    final precoMaskFormatter =
        MaskTextInputFormatter(mask: '', filter: {"#": RegExp(r'[0-9]')});
    TextEditingController descricaoDaDespesaController =
        TextEditingController();
    TextEditingController tipoDespesaController = TextEditingController();

    if (model != null) {
      title = "Editando";
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
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 32,
            right: 32,
            top: 32,
          ),
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
                  hintText: 'Valor da Despesa.',
                  labelText: '100.00',
                ),
                inputFormatters: [precoMaskFormatter],
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
                  labelText: 'Descrição',
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
      print('Erro ao atualizar lista: $e');
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
