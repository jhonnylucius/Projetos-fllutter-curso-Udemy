import 'package:cloud_firestore/cloud_firestore.dart'; // Importa o pacote do Firestore
import 'package:firebase_auth/firebase_auth.dart'; // Importa o pacote de autenticação do Firebase
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart'; // Importa o pacote do Flutter para widgets
import 'package:logger/logger.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart'; // Importa o pacote para formatar inputs de texto
import 'package:pj1/components/menu.dart'; // Importa o componente de menu
import 'package:pj1/models/costs.dart';
import 'package:pj1/models/hour.dart';
import 'package:uuid/uuid.dart';

class CostsScreen extends StatefulWidget {
  // Tela inicial do aplicativo
  final User user; // Usuário logado
  const CostsScreen({
    super.key,
    required this.user,
  }); // Construtor que recebe o usuário

  @override
  State<CostsScreen> createState() =>
      _HomeScreenState(); // Cria o estado da tela
}

class _HomeScreenState extends State<CostsScreen> {
  // Estado da tela inicial
  List<Costs> listCosts = []; // Lista de custos registrados
  FirebaseFirestore firestore =
      FirebaseFirestore.instance; // Instância do Firestore

  @override
  void initState() {
    // Método chamado ao inicializar o estado
    super.initState();

    setupFCM(); // Configura o FCM
    refresh(null); // Atualiza a lista de custos
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
          label: const Text('Add Custos'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromARGB(255, 223, 169, 220)
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
                        'assets/logo_512x512.png',
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
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView(
                  // ListView para exibir a lista de custos
                  padding: EdgeInsets.only(left: 4, right: 4),
                  children: List.generate(listCosts.length, (index) {
                    // Gera os cards para cada despesa
                    Costs model = listCosts[index];
                    return Dismissible(
                      // Widget que permite deslizar o card para remover
                      key: ValueKey<Costs>(model),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 12),
                        color: Colors.red,
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (direction) {
                        remove(model); // Remove a registro de despesa
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
                              title: Text(
                                  "Data: ${model.data}"), // Exibe a data e hora formatada
                              subtitle: Text(model
                                  .descricaoDaDespesa!), // Exibe a descrição
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
        ));
  }

  showFormModal({Costs? model}) {
    // Método para exibir o modal de formulário
    String title = "Adicionar"; // Título do modal
    String confirmationButton = "Salvar"; // Texto do botão de confirmação
    String SkipButton = "Cancelar"; // Texto do botão de cancelamento

    TextEditingController dataController =
        TextEditingController(); // Controller para o campo de data
    final dataMaskFormatter = MaskTextInputFormatter(
        mask: '##/##/####'); // Formatador para o campo de data
    TextEditingController precoController =
        TextEditingController(); // Controller para o campo de minutos
    final precoMaskFormatter =
        MaskTextInputFormatter(mask: '', filter: {"#": RegExp(r'[0-9]')});
    TextEditingController descricaoDaDespesaController =
        TextEditingController(); // Controller para o campo de descrição
    TextEditingController tipoDespesaController =
        TextEditingController(); // Controller para o campo de tipo de despesa
    final tipoDespesaMaskFormatter = MaskTextInputFormatter(mask: '');
    TextFormField(
      controller: tipoDespesaController,
      inputFormatters: [tipoDespesaMaskFormatter],
      decoration: InputDecoration(
        labelText: 'Tipo de Despesa',
        hintText: 'Ex: Aluguel, Internet, Compras do mês',
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );

    if (model != null) {
      // Se estiver editando, preenche os campos
      title = "Editando";
      dataController.text = model.data;
      tipoDespesaController.text = model.tipoDespesa ?? '';
      descricaoDaDespesaController.text = model.descricaoDaDespesa ?? '';
      if (model.descricaoDaDespesa != null) {
        descricaoDaDespesaController.text = model.descricaoDaDespesa!;
      }
      precoController.text = model.preco.toString();
      confirmationButton = "Atualizar";
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Permite que o modal ocupe toda a tela
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context)
                .viewInsets
                .bottom, // Ajusta conforme o teclado
            left: 32,
            right: 32,
            top: 32,
          ),
          child: Container(
            // Removido height fixo para ajustar automaticamente
            child: ListView(
              shrinkWrap: true, // Ajusta o tamanho conforme conteúdo
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
                  controller: precoController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Valor da Despesa.',
                    labelText: '100.00',
                  ),
                  inputFormatters: [precoMaskFormatter],
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: descricaoDaDespesaController,
                  decoration: InputDecoration(
                    hintText: 'Qual a despesa que você pagou?',
                    labelText: 'Descrição',
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: tipoDespesaController,
                  decoration: InputDecoration(
                    hintText: 'Essa despesa é mensal, anual ou exporádica?',
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
                        Costs costs = Costs(
                          id: const Uuid().v1(),
                          data: dataController.text,
                          preco: double.tryParse(precoController.text) ?? 0.0,
                          descricaoDaDespesa: descricaoDaDespesaController.text,
                          tipoDespesa: tipoDespesaController.text,
                        );

                        if (descricaoDaDespesaController.text != "") {
                          costs.descricaoDaDespesa =
                              descricaoDaDespesaController.text;
                        }

                        if (model != null) {
                          costs.id = model.id;
                        }
                        firestore.collection(widget.user.uid).doc(costs.id).set(
                              costs.toMap(),
                            );
                        refresh(null); // Atualiza a lista de horas
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
          ),
        );
      },
    );
  }

  void remove(Costs model) {
    // Método para remover uma despesa
    firestore.collection(widget.user.uid).doc(model.id).delete();
    refresh(null); // Atualiza a lista de despesas
  }

  Future<void> refresh(dynamic snapshot) async {
    try {
      List<Hour> temp = [];

      // Usar o querySnapshot obtido do Firestore
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firestore.collection(widget.user.uid).get();

      // Iterar sobre os documentos do querySnapshot
      for (var doc in querySnapshot.docs) {
        temp.add(Hour.fromMap(doc.data()));
      }

      // Atualizar o estado com a nova lista
      setState(() {
        listCosts = temp.cast<Costs>();
      });
    } catch (e) {
      Logger().e('Erro ao atualizar lista: $e');
      // Opcional: Mostrar mensagem de erro para o usuário
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao atualizar lista')),
      );
    }
  }
}

void setupFCM() async {
  // Configurar o Firebase Cloud Messaging (FCM)
  final fcmToken = await FirebaseMessaging.instance.getToken();
  Logger().e('FCM Token: $fcmToken');

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    Logger().e('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    Logger().e('User granted provisional permission');
  } else {
    Logger().e('User declined or has not accepted permission');
  }

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    Logger()
        .e('Message also contained a notification: ${message.notification}');
    Logger().e('Message data: ${message.data}');

    if (message.notification != null) {
      Logger()
          .e('Message also contained a notification: ${message.notification}');
    }
  });
}
