import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:pj1/screens/register_screen.dart';
import 'package:pj1/screens/reset_password_modal.dart';
import 'package:pj1/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController __senhaController = TextEditingController();

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 85, 88, 240),
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  children: [
                    FlutterLogo(size: 76.0),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'E-mail'),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      obscureText: true,
                      controller: __senhaController,
                      decoration: InputDecoration(hintText: 'Senha'),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        _authService
                            .entrarUsuario(
                                _emailController.text, __senhaController.text)
                            .then(
                          (String? erro) {
                            if (erro != null) {
                              final snackBar = SnackBar(
                                content: Text('Dados Inválidos'),
                                backgroundColor: Colors.red,
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                        );
                      },
                      child: const Text('Entrar'),
                    ),
                    SizedBox(height: 16.0),
                    SignInButton(
                      Buttons.Google,
                      text: 'Entrar com Google',
                      onPressed: () {},
                    ),
                    SizedBox(height: 16.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                      },
                      child: Text('Criar uma conta!'),
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ResetPasswordModal();
                            });
                      },
                      child: Text('Esqueci minha senha'),
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
