import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatefulWidget {
  final User user;

  const VerifyEmailScreen({super.key, required this.user});

  @override
  VerifyEmailScreenState createState() => VerifyEmailScreenState();
}

class VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verifique seu Email'),
        automaticallyImplyLeading: false, // Remove a seta de voltar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Um email de verificação foi enviado para ${widget.user.email}.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                bool emailVerified = false;
                for (int i = 0; i < 5; i++) {
                  await Future.delayed(Duration(seconds: 2));
                  await widget.user.reload();
                  if (widget.user.emailVerified) {
                    emailVerified = true;
                    break;
                  }
                }
                if (emailVerified) {
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
                await widget.user.sendEmailVerification();
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
