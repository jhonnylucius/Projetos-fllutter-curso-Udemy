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
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User? user = snapshot.data;
            if (user != null && user.emailVerified) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacementNamed(context, '/home');
              });
            }
          }
          return Center(
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
          );
        },
      ),
    );
  }
}
