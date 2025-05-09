import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pj1/components/menu.dart';
import 'package:pj1/models/revenues.dart';
import 'package:uuid/uuid.dart';

class RevenuesScreen extends StatefulWidget {
  final User user;
  const RevenuesScreen({
    super.key,
    required this.user,
  });

  @override
  State<RevenuesScreen> createState() => _RevenuesScreenState();
}

class _RevenuesScreenState extends State<RevenuesScreen> {
  List<Revenues> listRevenues = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>(); // Chave do formulário

  final List<String> _tiposReceita = [
    'Esporádica',
    'Mensal',
    'Anual',
  ];

  @override
  void initState() {
    super.initState();
    refresh(); // Atualizar lista de receitas ao inicializar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(user: widget.user), // Menu lateral
      appBar: AppBar(
        title: const Text('GestorFinanceiro'),
        elevation: 2,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton.extended(
              heroTag: 'add_revenue', // Adicione esta linha
              onPressed: () => showFormModal(),
              icon: const Icon(Icons.add),
              label: const Text(
                'Add Receitas',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            FloatingActionButton.extended(
              heroTag: 'goto_costs', // Adicione esta linha
              onPressed: () {
                Navigator.pushNamed(context, '/costs');
              },
              icon: const Icon(Icons.arrow_forward),
              label: const Text(
                'Ir p/ Despesas',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: [
          Container(
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
            padding: const EdgeInsets.only(bottom: 80),
            child: listRevenues.isEmpty
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
                        const Text(
                          'Vamos começar?',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 251, 251, 252),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Registre suas Receitas',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 129, 18, 151),
                          ),
                        ),
                      ],
                    ),
                  )
                : CustomScrollView(
                    slivers: [
                      SliverList(
                          delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          Revenues model = listRevenues[index];
                          return Dismissible(
                            key: ValueKey<Revenues>(
                                model), // Identificador único
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 12),
                              color: Colors.red, // Fundo vermelho ao deslizar
                              child:
                                  const Icon(Icons.delete, color: Colors.white),
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
                                      showFormModal(
                                          model: model); // Edita a receita
                                    },
                                    onTap: () {},
                                    leading: const Icon(Icons.list_alt_rounded,
                                        size: 56),
                                    title: Text("Data: ${model.data}"),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "Preço: ${model.preco.toStringAsFixed(2)}"),
                                        Text(
                                          "Descrição: ${model.descricaoDaReceita != null && model.descricaoDaReceita!.isNotEmpty ? model.descricaoDaReceita : 'Sem descrição'}",
                                        ),
                                        Text(
                                          "tipo da Receita: ${model.tipoReceita.isNotEmpty ? model.tipoReceita : 'Sem descrição'}",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        childCount: listRevenues.length,
                      )),
                    ],
                  ),
          ),
        ],
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

  showFormModal({Revenues? model}) {
    String confirmationButton = "Salvar";
    String skipButton = "Cancelar";

    TextEditingController dataController = TextEditingController();
    TextEditingController precoController = TextEditingController();
    var precoMaskFormatter = MaskTextInputFormatter(
      mask: '#######.##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );

    precoController.addListener(() {
      precoMaskFormatter.updateMask();
    });
    TextEditingController descricaoDaReceitaController =
        TextEditingController();
    TextEditingController tipoReceitaController = TextEditingController();

    if (model != null) {
      dataController.text = model.data;
      tipoReceitaController.text = model.tipoReceita;
      descricaoDaReceitaController.text = model.descricaoDaReceita ?? '';
      precoController.text = model.preco.toString();
      confirmationButton = "Atualizar";
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: dataController,
                  decoration: InputDecoration(
                    hintText: '01/01/2025',
                    labelText: 'Data',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context, dataController),
                    ),
                  ),
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a data.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: precoController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Valor da Receita.(USE PONTO E NÃO VIRGULA!)',
                    labelText: '100.00',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o preço.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: descricaoDaReceitaController,
                  decoration: const InputDecoration(
                    hintText: 'Qual a receita que você recebeu?',
                    labelText: 'Descrição',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a descrição.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: tipoReceitaController.text.isEmpty
                      ? _tiposReceita[0]
                      : tipoReceitaController.text,
                  decoration: const InputDecoration(
                    labelText: 'Tipo da Receita',
                    border: OutlineInputBorder(),
                  ),
                  items: _tiposReceita.map((String tipo) {
                    return DropdownMenuItem<String>(
                      value: tipo,
                      child: Text(tipo),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      tipoReceitaController.text = newValue!;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, selecione o tipo de receita.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(skipButton),
                    ),
                    const SizedBox(width: 16),
                    TextButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          Revenues revenues = Revenues(
                            id: const Uuid().v1(),
                            data: dataController.text,
                            preco: double.tryParse(precoController.text) ?? 0.0,
                            descricaoDaReceita:
                                descricaoDaReceitaController.text,
                            tipoReceita: tipoReceitaController.text,
                          );

                          if (model != null) {
                            revenues.id = model.id;
                          }

                          await firestore
                              .collection('users/${widget.user.uid}/Revenues')
                              .doc(revenues.id)
                              .set(revenues.toMap());

                          await refresh();
                          if (mounted) {
                            if (context.mounted) {
                              Navigator.pop(context);
                            }
                          }
                        } else {
                          _showErrorDialog();
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

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Campos Obrigatórios'),
          content:
              const Text('Por favor, preencha todos os campos obrigatórios.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> refresh([dynamic snapshot]) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firestore.collection('users/${widget.user.uid}/Revenues').get();

      setState(() {
        listRevenues = querySnapshot.docs
            .map((doc) => Revenues.fromMap(doc.data()))
            .toList();
      });
    } catch (e) {
      Logger().e('Erro ao atualizar lista: $e');
    }
  }

  Future<void> remove(Revenues revenues) async {
    await firestore
        .collection('users/${widget.user.uid}/Revenues')
        .doc(revenues.id)
        .delete();
    refresh();
  }
}
