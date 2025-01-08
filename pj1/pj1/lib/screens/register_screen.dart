import 'package:flutter/material.dart';
import 'package:pj1/services/auth_service.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController =
      TextEditingController();
  final TextEditingController _nomeController = TextEditingController();

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background_login.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/Icon-192.png',
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(height: 12.0),
                    TextField(
                      controller: _nomeController,
                      decoration: InputDecoration(labelText: 'Nome'),
                    ),
                    SizedBox(height: 12.0),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'E-mail'),
                    ),
                    SizedBox(height: 12.0),
                    TextField(
                      obscureText: true,
                      controller: _senhaController,
                      decoration: InputDecoration(labelText: 'Senha'),
                    ),
                    SizedBox(height: 12.0),
                    TextField(
                      obscureText: true,
                      controller: _confirmarSenhaController,
                      decoration: InputDecoration(labelText: 'Confirmar Senha'),
                    ),
                    SizedBox(height: 12.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_senhaController.text ==
                            _confirmarSenhaController.text) {
                          _authService
                              .cadastrarUsuario(
                            email: _emailController.text,
                            senha: _senhaController.text,
                            nome: _nomeController.text,
                          )
                              .then((String? erro) {
                            if (erro != null) {
                              final snackBar = SnackBar(
                                content: Text(erro),
                                backgroundColor: Colors.red,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              Navigator.pop(context);
                            }
                          });
                        } else {
                          final snackBar = SnackBar(
                            content: Text('Senhas não conferem.'),
                            backgroundColor: Colors.red,
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Text('Cadastrar'),
                    ),
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

// explicações
//  - O código acima é a tela de cadastro de usuário. O usuário informa o
// e-mail, a senha, a confirmação da senha e o nome. O botão "Cadastrar"
// chama o método cadastrarUsuario do AuthService, que é responsável por
// criar um novo usuário no Firebase Authentication.
//  - O método cadastrarUsuario recebe o e-mail, a senha e o nome do usuário
// e chama o método createUserWithEmailAndPassword do FirebaseAuth para
// criar o usuário. Se ocorrer algum erro, o método retorna uma mensagem
// de erro. Caso contrário, o método retorna null.
//  - O método cadastrarUsuario é chamado quando o usuário clica no botão
// "Cadastrar". Se as senhas informadas não conferirem, é exibida uma
// mensagem de erro. Caso contrário, o método cadastrarUsuario é chamado.
// Se ocorrer algum erro, é exibida uma mensagem de erro. Caso contrário,
// o usuário é redirecionado para a tela de login.
//  - O botão "Já tenho uma conta!" redireciona o usuário para a tela de
// login.
//  - O código acima é um exemplo de como criar um novo usuário no Firebase
// Authentication. O Firebase Authentication é um serviço que permite
// autenticar usuários em aplicativos móveis e web. Ele fornece métodos
// para criar, autenticar, atualizar e excluir usuários, além de fornecer
// métodos para redefinir a senha e enviar e-mails de verificação.
//  - O Firebase Authentication é uma solução pronta para autenticação de
// usuários, que permite autenticar usuários por e-mail e senha, telefone,
// Google, Facebook, Twitter, GitHub e outros provedores de autenticação.
// Ele fornece métodos para criar, autenticar, atualizar e excluir usuários,
// além de fornecer métodos para redefinir a senha e enviar e-mails de
// verificação.
