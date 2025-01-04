import 'package:cloud_firestore/cloud_firestore.dart'; // Importa o pacote do Firestore
import 'package:firebase_auth/firebase_auth.dart'; // Importa o pacote de autenticação do Firebase
import 'package:flutter/material.dart'; // Importa o pacote do Flutter para widgets
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart'; // Importa o pacote para formatar inputs de texto
import 'package:pj1/components/menu.dart'; // Importa o componente de menu
import 'package:pj1/helpers/hour_helpers.dart'; // Importa o helper de horas
import 'package:pj1/models/hour.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget {
  // Tela inicial do aplicativo
  final User user; // Usuário logado
  const HomeScreen({
    super.key,
    required this.user,
  }); // Construtor que recebe o usuário

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState(); // Cria o estado da tela
}

class _HomeScreenState extends State<HomeScreen> {
  // Estado da tela inicial
  List<Hour> listHours = []; // Lista de horas registradas
  FirebaseFirestore firestore =
      FirebaseFirestore.instance; // Instância do Firestore

  @override
  void initState() {
    // Método chamado ao inicializar o estado
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Método para construir a tela
    return Scaffold(
      drawer: Menu(user: widget.user), // Menu lateral
      appBar: AppBar(
        title: Text('AgendaPRO'), // Título da AppBar
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showFormModal(); // Ação do botão flutuante
        }, // Ação do botão flutuante
        child: Icon(Icons.add), // Ícone do botão flutuante
      ),
      body: listHours.isEmpty
          ? const Center(
              child: Text(
                'nada por aqui.\nVamos registrar um dia de trabalho?', // Mensagem caso não haja registros
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          : ListView(
              // ListView para exibir a lista de horas
              padding: EdgeInsets.only(left: 4, right: 4),
              children: List.generate(listHours.length, (index) {
                // Gera os cards para cada hora
                Hour model = listHours[index];
                return Dismissible(
                  // Widget que permite deslizar o card para remover
                  key: ValueKey<Hour>(model),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 12),
                    color: Colors.red,
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    remove(model); // Remove a hora
                  },
                  child: Card(
                    elevation: 2,
                    child: Column(
                      children: [
                        ListTile(
                          onLongPress: () {},
                          onTap: () {},
                          leading: Icon(Icons.list_alt_rounded, size: 56),
                          title: Text(
                              "Data: ${model.data} hora: ${HourHelper.minutosToHours((model.minutos))}"), // Exibe a data e hora formatada
                          subtitle: Text(model.descricao!), // Exibe a descrição
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
    );
  }

  showFormModal({Hour? model}) {
    // Método para exibir o modal de formulário
    String title = "Adicionar"; // Título do modal
    String confirmationButton = "Salvar"; // Texto do botão de confirmação
    String SkipButton = "Cancelar"; // Texto do botão de cancelamento

    TextEditingController dataController =
        TextEditingController(); // Controller para o campo de data
    final dataMaskFormatter = MaskTextInputFormatter(
        mask: '##/##/####'); // Formatador para o campo de data
    TextEditingController minutoController =
        TextEditingController(); // Controller para o campo de minutos
    final minutoMaskFormatter = MaskTextInputFormatter(
        mask: '##:##'); // Formatador para o campo de minutos
    TextEditingController descricaoController =
        TextEditingController(); // Controller para o campo de descrição

    if (model != null) {
      // Se estiver editando, preenche os campos
      title = "Editando";
      dataController.text = model.data;
      minutoController.text = HourHelper.minutosToHours(model.minutos);
      if (model.descricao != null) {
        descricaoController.text = model.descricao!;
      }
    }

    showModalBottomSheet(
      // Exibe o modal na parte inferior da tela
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(32),
          child: ListView(
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
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: minutoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '08:00',
                  labelText: 'Hora Trabalhadas',
                ),
                inputFormatters: [minutoMaskFormatter],
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: descricaoController,
                decoration: InputDecoration(
                  hintText: 'Lembrete do que você fez',
                  labelText: 'Descrição',
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(SkipButton),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Hour hour = Hour(
                        id: const Uuid().v1(),
                        data: dataController.text,
                        minutos:
                            HourHelper.hoursToMinutos(minutoController.text),
                        descricao: descricaoController.text,
                      );
                      if (descricaoController.text != "") {
                        hour.descricao = descricaoController.text;
                      }

                      if (model != null) {
                        hour.id = model.id;
                      }
                      firestore.collection(widget.user.uid).doc(hour.id).set(
                            hour.toMap(),
                          );

                      refresh();

                      Navigator.pop(context);
                    },
                    child: Text(confirmationButton),
                  ),
                ],
              ),
              SizedBox(
                height: 180,
              ),
            ],
          ),
        );
      },
    );
  }

  void remove(Hour model) {
    // Método para remover uma hora
    firestore.collection(widget.user.uid).doc(model.id).delete();
    refresh(); // Atualiza a lista de horas
  }

  void refresh() {}
}
