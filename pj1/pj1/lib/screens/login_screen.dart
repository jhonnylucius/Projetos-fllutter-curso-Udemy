import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pj1/screens/register_screen.dart';
import 'package:pj1/screens/reset_password_modal.dart';
import 'package:pj1/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController __senhaController = TextEditingController();

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/background_login.jpg"), // Caminho da sua imagem
            fit: BoxFit.cover, // Adapta a imagem ao container
          ),
        ),
        child: Column(
          children: [
            FlutterLogo(size: 36.0),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'E-mail'),
            ),
            SizedBox(height: 16.0),
            TextField(
              obscureText: true,
              controller: __senhaController,
              decoration: InputDecoration(hintText: 'Senha'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                final scaffoldMessenger = ScaffoldMessenger.of(context);
                final erro = await _authService.entrarUsuario(
                    _emailController.text, __senhaController.text);
                if (erro != null) {
                  final snackBar = SnackBar(
                    content: Text('Dados Inválidos'),
                    backgroundColor: Colors.red,
                  );
                  scaffoldMessenger.showSnackBar(snackBar);
                }
              },
              child: const Text('Entrar'),
            ),
            SizedBox(height: 16.0),
            SignInButton(
              Buttons.Google,
              text: 'Entrar com Google',
              onPressed: () {
                singinWithGoogle();
              },
            ),
            SizedBox(height: 12.0),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()));
              },
              child: Text('Criar uma conta!'),
            ),
            SizedBox(height: 12.0),
            TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ResetPasswordModal();
                    });
              },
              child: Text('Esqueci minha senha!'),
            ),
          ],
        ),
      ),
    );
  }

  Future<UserCredential> singinWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
