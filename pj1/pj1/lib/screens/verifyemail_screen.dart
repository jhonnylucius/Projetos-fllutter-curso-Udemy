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
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startVerificationCheck();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startVerificationCheck() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.reload();
        if (user.emailVerified) {
          _navigateToHome();
          timer.cancel();
        }
      }
    });
  }

  void _navigateToHome() {
    if (mounted) {
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Desabilita o gesto de voltar e o botão físico/virtual
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Verifique seu Email'),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Um email de verificação foi enviado para ${widget.user.email}.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Assim que você verificar seu email, você será redirecionado automaticamente.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () async {
                  await widget.user.sendEmailVerification();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Email de verificação reenviado.'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                child: const Text('Reenviar email de verificação'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
