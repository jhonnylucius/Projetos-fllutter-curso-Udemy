import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:pj1/screens/register_screen.dart';
import 'package:pj1/screens/reset_password_modal.dart';
import 'package:pj1/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/background_login.jpg"), // Caminho da sua imagem
            fit: BoxFit.cover, // Adapta a imagem ao container
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(
                    255, 255, 255, 1), // Branco com 80% de opacidade
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/Icon-192.png',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'E-mail'),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    obscureText: true,
                    controller: _senhaController,
                    decoration: const InputDecoration(hintText: 'Senha'),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      _authService
                          .entrarUsuario(
                        _emailController.text,
                        _senhaController.text,
                      )
                          .then(
                        (String? erro) {
                          if (erro != null) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(erro),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                      );
                    },
                    child: const Text('Entrar'),
                  ),
                  const SizedBox(height: 16.0),
                  SignInButton(
                    Buttons.Google,
                    text: 'Entrar com Google',
                    onPressed: () {
                      _authService.signInWithGoogle();
                    },
                  ),
                  const SizedBox(height: 12.0),
                  const ColoredBox(
                    color: Color.fromARGB(255, 226, 191, 224),
                    child: SizedBox(
                      height: 1,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    child: const Text('Criar uma conta!'),
                  ),
                  const SizedBox(height: 12.0),
                  TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const ResetPasswordModal();
                          });
                    },
                    child: const Text('Esqueci minha senha!'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
