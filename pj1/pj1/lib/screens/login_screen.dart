import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController __senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 85, 88, 240),
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'E-mail'),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      obscureText: true,
                      controller: __senhaController,
                      decoration: InputDecoration(labelText: 'Senha'),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Entrar'),
                    ),
                    SizedBox(height: 10.0),
                    SignInButton(
                      Buttons.Google,
                      text: "Entrar com Google",
                      onPressed: () {},
                    ),
                    SizedBox(height: 10.0),
                    TextButton(
                      onPressed: () {},
                      child: Text('Criar uma conta!'),
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
