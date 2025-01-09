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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Bem-vindo, ${widget.user.displayName}!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pushNamed(context, '/costs');
                },
                icon: const Icon(Icons.attach_money),
                label: const Text('Despesas'),
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
              SizedBox(height: 16),
              FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pushNamed(context, '/expenses');
                },
                icon: const Icon(Icons.attach_money_sharp),
                label: const Text('Receitas'),
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(height: 16),
              FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pushNamed(context, '/dashboard');
                },
                icon: const Icon(Icons.dashboard),
                label: const Text('Dashboard'),
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
