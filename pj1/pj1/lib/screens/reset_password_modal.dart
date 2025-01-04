import 'package:flutter/material.dart';
import 'package:pj1/services/auth_service.dart';

class _ResetPasswordModalState extends StatefulWidget {
  const _ResetPasswordModalState({super.key});

  @override
  _ResetPasswordModalStateState createState() =>
      _ResetPasswordModalStateState();
}

class _ResetPasswordModalStateState extends State<_ResetPasswordModalState> {
  final TextEditingController _emailController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Recuperar Senha'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'E-mail'),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              _authService.resetPassword(_emailController.text);
              Navigator.of(context).pop();
            },
            child: const Text('Enviar'),
          ),
        ],
      ),
    );
  }
}
