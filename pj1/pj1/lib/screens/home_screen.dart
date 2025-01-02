import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pj1/components/menu.dart';
import 'package:pj1/models/hour.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  HomeScreen({super.key, required this.user, required User User});

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
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView(
              padding: EdgeInsets.only(left: 4, right: 4),
              children: List.generate(listHours.length, (index) {
                Hour model = listHours[index];
              }),
            ),
    );
  }
}
