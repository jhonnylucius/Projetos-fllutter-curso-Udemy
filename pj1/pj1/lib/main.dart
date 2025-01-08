import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pj1/firebase_options.dart';
import 'package:pj1/screens/costs_screen.dart'; // Importar costs_screen
import 'package:pj1/screens/dashBoard_screen.dart';
import 'package:pj1/screens/expenses_screen.dart'; // Importar expenses_screen
import 'package:pj1/screens/home_screen.dart';
import 'package:pj1/screens/login_screen.dart';

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
      title: 'AgendaPRO',
      routes: {
        '/': (context) => const RoteadorTelas(),
        '/dashboard': (context) => DashBoardScreen(
            userId: FirebaseAuth.instance.currentUser?.uid ?? ''),
        '/costs': (context) => CostsScreen(
            user: FirebaseAuth
                .instance.currentUser!), // Adicionar rota para CostsScreen
        '/expenses': (context) => ExpensesScreen(
            user: FirebaseAuth
                .instance.currentUser!), // Adicionar rota para ExpensesScreen
      },
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 222, 143, 224),
          brightness: Brightness.light,
          primary: Colors.deepPurple,
          secondary: Colors.deepPurple.shade300,
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
            ),
          );
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
}
