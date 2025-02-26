import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logger/logger.dart';
import 'package:pj1/firebase_options.dart';
import 'package:pj1/screens/costs_screen.dart';
import 'package:pj1/screens/dashboard_screen.dart';
import 'package:pj1/screens/expenses_screen.dart';
import 'package:pj1/screens/home_screen.dart';
import 'package:pj1/screens/login_screen.dart';
import 'package:pj1/screens/verifyemail_screen.dart';
import 'package:pj1/widgets/terms_of_service_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MyApp());
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Logger().e('### Mensagem recebida em segundo plano: ${message.messageId}');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GestorFinanceiro',
      routes: {
        '/': (context) => const RoteadorTelas(),
        '/dashboard': (context) =>
            DashBoardScreen(user: FirebaseAuth.instance.currentUser?.uid ?? ''),
        '/costs': (context) =>
            CostsScreen(user: FirebaseAuth.instance.currentUser!),
        '/expenses': (context) =>
            ExpensesScreen(user: FirebaseAuth.instance.currentUser!),
        '/home': (context) => HomeScreen(
            user: FirebaseAuth
                .instance.currentUser!), // Ajustar para passar o usuário atual
        '/verify-email': (context) => VerifyEmailScreen(
            user: FirebaseAuth.instance
                .currentUser!), // Adicionar rota para verificação de email
        '/login': (context) =>
            LoginScreen(), // Adicionar rota para verificação de email
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 123, 21, 141),
          brightness: Brightness.light,
          primary: Colors.deepPurple,
          secondary: Colors.deepPurple,
          surfaceContainerHighest: const Color.fromARGB(255, 222, 232, 245),
          surface: const Color.fromARGB(255, 249, 249, 250),
        ),
        cardTheme: CardTheme(
          elevation: 4,
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class RoteadorTelas extends StatelessWidget {
  const RoteadorTelas({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkTermsAccepted(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text('Erro ao carregar dados.'),
            ),
          );
        } else if (snapshot.data == false) {
          return TermsOfServiceScreen();
        } else {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasError) {
                return const Scaffold(
                    body: Center(
                  child: Text('Erro ao carregar dados.'),
                ));
              } else if (snapshot.hasData) {
                return HomeScreen(
                  user: snapshot.data!,
                );
              } else {
                return LoginScreen();
              }
            },
          );
        }
      },
    );
  }

  Future<bool> _checkTermsAccepted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('terms_accepted') ?? false;
  }
}

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TermsOfServiceDialog(
          onAccepted: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('terms_accepted', true);
            Navigator.of(context).pushReplacementNamed('/');
          },
          onDeclined: () {
            // Fechar o aplicativo ou redirecionar para outra tela
            Navigator.of(context).pushReplacementNamed('/login');
          },
        ),
      ),
    );
  }
}
