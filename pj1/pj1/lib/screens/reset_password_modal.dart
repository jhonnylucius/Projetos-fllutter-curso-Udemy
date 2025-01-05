import 'package:flutter/material.dart';
import 'package:pj1/services/auth_service.dart';

class ResetPasswordModal extends StatefulWidget {
  const ResetPasswordModal({super.key});

  State<ResetPasswordModal> createState() => _ResetPasswordModalState();
}

class _ResetPasswordModalState extends State<ResetPasswordModal> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Redefinir Senha'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(labelText: 'Endereço de E-mail'),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Por favor, informe um email válido';
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              authService
                  .redefinicaoSenha(email: _emailController.text)
                  .then((String? erro) {
                if (erro != null) {
                  final snackBar = SnackBar(
                    content: Text(erro),
                    backgroundColor: Colors.red,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  final snackBar = SnackBar(
                    content: Text('E-mail enviado com sucesso.'),
                    backgroundColor: Colors.green,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              });
              Navigator.of(context).pop();
            }
          },
          child: Text('Enviar'),
        ),
      ],
    );
  }
}
