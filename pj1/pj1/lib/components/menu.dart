import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pj1/services/auth_service.dart';

class Menu extends StatelessWidget {
  final User user;
  final String senha = 'your_password'; // Replace with actual password logic

  const Menu({super.key, required this.user});

  void _confirmarExclusao(BuildContext context) {
    TextEditingController senhaController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirmar Exclusão'),
        content: TextField(
          controller: senhaController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Digite sua senha para confirmar',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              String? erro =
                  await AuthService().excluiConta(senha: senhaController.text);

              Navigator.pop(context);

              if (erro != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(erro)),
                );
              } else {
                Navigator.of(context).pushReplacementNamed('/login');
              }
            },
            child: Text('Excluir'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountEmail: Text(user.email!),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: user.photoURL != null
                  ? ClipOval(
                      child: Image.network(
                        user.photoURL!,
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    )
                  : const Icon(
                      Icons.manage_accounts_rounded,
                      size: 48,
                    ),
            ),
            accountName: Text(
              user.displayName != null ? user.displayName! : '',
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text('Sair'),
            onTap: () {
              AuthService().deslogar();
            },
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: const Text('Excluir Conta'),
            onTap: () => _confirmarExclusao(context),
          ),
        ],
      ),
    );
  }
}
