import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pj1/components/menu.dart';
import 'package:pj1/helpers/hour_helpers.dart';
import 'package:pj1/models/hour.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  const HomeScreen({super.key, required this.user, required User User});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Hour> listHours = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(user: widget.user),
      appBar: AppBar(
        title: Text('AgendaPRO'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: listHours.isEmpty
          ? const Center(
              child: Text(
                'nada por aqui.\nVamos registrar um dia de trabalho?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          : ListView(
              padding: EdgeInsets.only(left: 4, right: 4),
              children: List.generate(listHours.length, (index) {
                Hour model = listHours[index];
                return Dismissible(
                  key: ValueKey<Hour>(model),
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 12),
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
                          onLongPress: () {},
                          onTap: () {},
                          leading: Icon(Icons.list_alt_rounded, size: 56),
                          title: Text(
                              "Data: ${model.data} hora: ${HourHelper.minutosToHours((model.minutos))}"),
                          subtitle: Text(model.descricao!),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
    );
  }
}

showFormModal({Hour? model}) {
  String title = "Adicionar";
  String confirmationButton = 'Salvar';
  String skippedButton = 'Cancelar';

  TextEditingController dataController = TextEditingController();
  final dataMaskFormatter = MaskTextInputFormatter(mask: '##/##/####');
  final minutosMaskFormatter = MaskTextInputFormatter(mask: '##:##');
  final TextEditingController minutosController = TextEditingController();
  final descricaoController = TextEditingController();

  if(model != null){
    title = "Alterar";
    minutosController.text = HourHelper.minutosToHours(model.minutos);
    minutosMaskFormatter.formatEditUpdate(
      TextEditingValue.empty,
      TextEditingValue(text: minutosController.text),
    );
    minutosController.text = HourHelper.minutosToHours(model.minutos);
    descricaoController.text = model.descricao!;
  }
   
  }

  


Void remove(Hour model) {}


}

