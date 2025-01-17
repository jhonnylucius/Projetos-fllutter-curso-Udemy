import 'dart:async'; // Importe o pacote async

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
    _timer?.cancel(); // Cancela o timer ao sair da tela
    super.dispose();
  }

  void _startVerificationCheck() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.reload(); // Recarrega os dados do usuário
        if (user.emailVerified) {
          _navigateToHome(); // Navega para a tela home
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
    return WillPopScope(
      onWillPop: () async => false, // Desabilita o botão de voltar
      child: Scaffold(
        appBar: AppBar(
          title: Text('Verifique seu Email'),
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
              SizedBox(height: 16.0),
              Text(
                'Assim que você verificar seu email, você será redirecionado automaticamente.',
                textAlign: TextAlign.center,
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
      ),
    );
  }
}
