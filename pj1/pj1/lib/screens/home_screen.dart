import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pj1/components/menu.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String displayName = '';
  StreamSubscription<User?>? _authSubscription;

  @override
  void initState() {
    super.initState();
    _checkEmailVerification();
    _loadUserDisplayName();
    // Adicionar listener para mudanças no estado da autenticação
    _authSubscription =
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        _loadUserDisplayName();
      }
    });
  }

  Future<void> _checkEmailVerification() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      Navigator.pushReplacementNamed(context, '/verify-email');
    }
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    super.dispose();
  }

  Future<void> _loadUserDisplayName() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.reload();
      user = FirebaseAuth.instance.currentUser;

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .get();

      if (!mounted) return;

      setState(() {
        if (userDoc.exists && userDoc.data() != null) {
          Map<String, dynamic> userData =
              userDoc.data() as Map<String, dynamic>;
          displayName = userData['displayName'] ?? user?.displayName ?? '';
        } else {
          displayName = user?.displayName ?? '';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
            drawer: Menu(user: widget.user),
            appBar: AppBar(
              title: Text('GestorFinanceiro'),
              elevation: 2,
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
            ),
            body: Container(
              constraints: BoxConstraints(maxWidth: 480),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/background_home_screen.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 20,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          'Bem-vindo, $displayName',
                          style: TextStyle(
                              fontSize: 24,
                              color: const Color.fromARGB(255, 123, 21, 141),
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FloatingActionButton.extended(
                            onPressed: () {
                              Navigator.pushNamed(context, '/costs');
                            },
                            icon: const Icon(Icons.add, color: Colors.white),
                            label: const Text('Despesas',
                                style: TextStyle(color: Colors.white)),
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                          ),
                          SizedBox(height: 16),
                          FloatingActionButton.extended(
                            onPressed: () {
                              Navigator.pushNamed(context, '/Revenues');
                            },
                            icon: const Icon(Icons.add, color: Colors.white),
                            label: const Text('Receitas',
                                style: TextStyle(color: Colors.white)),
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pushNamed(context, '/budget/list');
                            },
                            icon: const Icon(Icons.calculate),
                            label: const Text('Orçamentos'),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
