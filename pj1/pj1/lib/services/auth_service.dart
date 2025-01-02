import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> entrarUsuario(String email, String senha) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: senha);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'uner-not-found':
          return 'Usuário não encontrado.';
        case 'wrong-password':
          return 'Falha no login.';
      }
      return e.code;
    }
    return null;
  }

  Future<String?> cadastrarUsuario(
      {required String email,
      required String senha,
      required String nome}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: senha);
      await userCredential.user!.updateDisplayName(nome);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'auth/email-already-in-use':
          return 'Email já está em uso.';
        case 'auth/invalid-email':
          return 'Dados incorretos.';
        case 'auth/weak-password':
          return 'Dados Incorretos.';
      }
      return e.code;
    }
    return null;
  }
}
