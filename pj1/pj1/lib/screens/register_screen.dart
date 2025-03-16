import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pj1/services/auth_service.dart';

import 'verifyemail_screen.dart'; // Importar VerifyEmailScreen

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController =
      TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final AuthService _authService = AuthService();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background_login.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/Icon-192.png',
                      width: 90,
                      height: 90,
                    ),
                    const SizedBox(height: 8.0),
                    TextField(
                      controller: _nomeController,
                      decoration: const InputDecoration(labelText: 'Nome'),
                    ),
                    const SizedBox(height: 8.0),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'E-mail'),
                    ),
                    const SizedBox(height: 8.0),
                    TextField(
                      obscureText: true,
                      controller: _senhaController,
                      decoration: const InputDecoration(labelText: 'Senha'),
                    ),
                    const SizedBox(height: 8.0),
                    TextField(
                      obscureText: true,
                      controller: _confirmarSenhaController,
                      decoration:
                          const InputDecoration(labelText: 'Confirmar Senha'),
                    ),
                    const SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () async {
                        if (_senhaController.text ==
                            _confirmarSenhaController.text) {
                          User? user = (await _authService.cadastrarUsuario(
                            email: _emailController.text,
                            senha: _senhaController.text,
                            nome: _nomeController.text,
                            context: context,
                          )) as User?;
                          if (user != null) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    VerifyEmailScreen(user: user),
                              ),
                            );
                          }
                        } else {
                          const snackBar = SnackBar(
                            content: Text('Senhas não conferem.'),
                            backgroundColor: Colors.red,
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: const Text('Cadastrar'),
                    ),
                    const SizedBox(height: 8.0),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text('Já tenho uma conta!'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
