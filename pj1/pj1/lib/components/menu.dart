import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pj1/screens/dashboard_screen.dart';
import 'package:pj1/screens/financial_tips_screen.dart';
import 'package:pj1/screens/home_screen.dart'; // Importar HomeScreen
import 'package:pj1/screens/report_screen.dart';
import 'package:pj1/services/auth_service.dart';

class Menu extends StatelessWidget {
  final User user;
  final String senha = 'Sua Senha'; // Replace with actual password logic

  const Menu({super.key, required this.user});

  void _confirmarExclusao(BuildContext context) {
    TextEditingController senhaController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar Exclusão'),
        content: TextField(
          controller: senhaController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Digite sua senha para confirmar',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
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
            child: const Text('Excluir'),
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
              backgroundColor: const Color.fromARGB(255, 201, 192, 228),
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
            accountName:
                Text(user.displayName != null ? user.displayName! : ''),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(user: user),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DashBoardScreen(user: user.uid),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text('Orçamentos'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/budget/list',
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Relatórios'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReportScreen(user: user),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.lightbulb_outline),
            title: const Text('Dicas Importantes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FinancialTipsScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sair'),
            onTap: () async {
              await AuthService().deslogar();
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Excluir Conta'),
            onTap: () => _confirmarExclusao(context),
          ),
        ],
      ),
    );
  }
}
