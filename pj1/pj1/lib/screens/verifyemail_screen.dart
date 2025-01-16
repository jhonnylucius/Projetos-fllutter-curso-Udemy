import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatefulWidget {
  final User user;

  const VerifyEmailScreen({super.key, required this.user});

  @override
  VerifyEmailScreenState createState() => VerifyEmailScreenState();
}

class VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool isVerifying = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startEmailVerificationCheck();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startEmailVerificationCheck() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      await widget.user.reload();
      if (widget.user.emailVerified) {
        timer.cancel();
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

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
              onPressed: isVerifying
                  ? null
                  : () async {
                      setState(() {
                        isVerifying = true;
                      });

                      await widget.user.reload();
                      if (widget.user.emailVerified) {
                        Navigator.pushReplacementNamed(context, '/home');
                      } else {
                        setState(() {
                          isVerifying = false;
                        });
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
