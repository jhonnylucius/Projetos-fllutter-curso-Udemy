import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatelessWidget {
  final User user;

  const VerifyEmailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verifique seu Email'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Um email de verificação foi enviado para ${user.email}.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                await Future.delayed(Duration(seconds: 3));
                await user.reload();
                if (user.emailVerified == true) {
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Email ainda não verificado.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Text('Já verifiquei meu email'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () async {
                await user.sendEmailVerification();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Email de verificação reenviado.'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: Text('Reenviar email de verificação'),
            ),
          ],
        ),
      ),
    );
  }
}
