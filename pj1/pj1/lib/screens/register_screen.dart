import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController =
      TextEditingController();
  final TextEditingController _nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
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
                      controller: _senhaController,
                      decoration: InputDecoration(labelText: 'Senha'),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      obscureText: true,
                      controller: _confirmarSenhaController,
                      decoration: InputDecoration(labelText: 'Confirmar Senha'),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: _nomeController,
                      decoration: InputDecoration(labelText: 'Nome'),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                        onPressed: () {
                          if (_senhaController.text ==
                              _confirmarSenhaController.text) {}
                        },
                        child: Text('Cadastrar')),
                    SizedBox(height: 16.0),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Já tenho uma conta!'),
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

// EXPLICAÇÕES
// Neste código, criamos a tela de cadastro de usuário. Para isso, criamos um
// novo widget chamado RegisterScreen que é uma StatelessWidget. O widget
// RegisterScreen é muito parecido com o widget LoginScreen, mas com algumas
// diferenças. A primeira diferença é que o widget RegisterScreen possui mais
// campos de texto para o usuário preencher. Além disso, o widget RegisterScreen
// possui um botão para cadastrar o usuário e um botão para voltar para a tela
// de login. Para isso, utilizamos o widget TextButton e a função Navigator.pop
// para voltar para a tela anterior. Para navegar para a tela de cadastro,
// utilizamos a função Navigator.push e a classe MaterialPageRoute. A função
// Navigator.push recebe dois argumentos: o contexto e a rota para a próxima
// tela. A rota para a próxima tela é criada com a classe MaterialPageRoute, que
// recebe um argumento: o builder, que é uma função que retorna a próxima tela.
// Neste caso, a próxima tela é a tela de cadastro, que é representada pelo
// widget RegisterScreen. Assim, ao clicar no botão "Criar uma conta!", o
// usuário é redirecionado para a tela de cadastro.
