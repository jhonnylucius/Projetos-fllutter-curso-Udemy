import 'dart:ffi';
import 'dart:js_interop';

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
  String skipButton = 'Cancelar';

  TextEditingController dataController = TextEditingController();
  final dataMaskFormatter = MaskTextInputFormatter(mask: '##/##/####');
  TextEditingController minutosController = TextEditingController();
  final minutosMaskFormatter = MaskTextInputFormatter(mask: '##:##');
  TextEditingController descricaoController = TextEditingController();
  

  if(model != null){
    title = "Alterar";
    dataController.text = model.data;
    minutosController.text = HourHelper.minutosToHours(model.minutos);
      if(model.descricao != null){
      descricaoController.text = model.descricao!;
    }
  }
    showModalBottomSheet(context: context, shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24),),),
              builder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(32),
                  child: ListView(
                    children: [
                      Text(title, style: Theme.of(context).textTheme.headlineSmall,)
                      TextFormField(
                        controller: dataController,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          hintText: 'Data',
                          labelText: 'Data',
                        ),
                        inputFormatters: [dataMaskFormatter],
                      ),
                          

                    ]
          
          )
                    ]

                  )
                    
            
            ,)
          }
        ),
        isDismissible: true,
    builder: builder)  
   
  }
   
  

  


Void remove(Hour model) {}


}

