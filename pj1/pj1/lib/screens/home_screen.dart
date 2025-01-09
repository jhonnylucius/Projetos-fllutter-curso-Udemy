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
                  'Bem-vindo, ${widget.user.displayName}',
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
                    icon: const Icon(Icons.add, 
                    color: Colors.white),
                    label: const Text('Despesas',
                        style: TextStyle(color: Colors.white)),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  SizedBox(height: 16),
                  FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.pushNamed(context, '/expenses');
                    },
                    icon: const Icon(Icons.add,
                        color: Colors.white),
                    label: const Text('Receitas',
                        style: TextStyle(color: Colors.white)),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
