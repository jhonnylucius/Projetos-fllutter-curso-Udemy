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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/background_login.jpg"), // Caminho da sua imagem
            fit: BoxFit.cover, // Adapta a imagem ao container
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Color.fromRGBO(
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
                  SizedBox(height: 16.0),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'E-mail'),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    obscureText: true,
                    controller: _senhaController,
                    decoration: InputDecoration(hintText: 'Senha'),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      _authService
                          .entrarUsuarioComVerificao(
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
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                      );
                    },
                    child: Text('Entrar'),
                  ),
                  SizedBox(height: 16.0),
                  SignInButton(
                    Buttons.Google,
                    text: 'Entrar com Google',
                    onPressed: () {
                      _authService.signInWithGoogle();
                    },
                  ),
                  SizedBox(height: 12.0),
                  ColoredBox(
                    color: const Color.fromARGB(255, 226, 191, 224),
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
                    child: Text('Criar uma conta!'),
                  ),
                  SizedBox(height: 12.0),
                  TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ResetPasswordModal();
                          });
                    },
                    child: Text('Esqueci minha senha!'),
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
