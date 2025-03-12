import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pj1/firebase_options.dart';
import 'package:pj1/models/budget/budget.dart';
import 'package:pj1/screens/budget/budget_compare_screen.dart';
import 'package:pj1/screens/budget/budget_detail_screen.dart';
import 'package:pj1/screens/budget/budget_list_screen.dart';
import 'package:pj1/screens/costs_screen.dart';
import 'package:pj1/screens/dashboard_screen.dart';
import 'package:pj1/screens/home_screen.dart';
import 'package:pj1/screens/login_screen.dart';
import 'package:pj1/screens/revenues_screen.dart';
import 'package:pj1/screens/verifyemail_screen.dart';
import 'package:pj1/services/budget_service.dart';
import 'package:pj1/services/price_alert_service.dart';
import 'package:pj1/widgets/terms_of_service_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Inicializar serviço de notificações
  final alertService = PriceAlertService();
  await alertService.initialize();

  runApp(MyApp());
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
        '/dashboard': (context) {
          final user = FirebaseAuth.instance.currentUser;
          return DashBoardScreen(user: user?.uid ?? '');
        },
        '/costs': (context) {
          final user = FirebaseAuth.instance.currentUser;
          if (user == null) return LoginScreen();
          return CostsScreen(user: user);
        },
        '/Revenues': (context) {
          final user = FirebaseAuth.instance.currentUser;
          if (user == null) return LoginScreen();
          return RevenuesScreen(user: user);
        },
        '/home': (context) {
          final user = FirebaseAuth.instance.currentUser;
          if (user == null) return LoginScreen();
          return HomeScreen(user: user);
        },
        '/verify-email': (context) {
          final user = FirebaseAuth.instance.currentUser;
          if (user == null) return LoginScreen();
          return VerifyEmailScreen(user: user);
        },
        '/login': (context) => LoginScreen(),
        // Rotas do orçamento
        '/budget/list': (context) {
          final user = FirebaseAuth.instance.currentUser;
          if (user == null) return LoginScreen();
          return BudgetListScreen(user: user);
        },
        '/budget/detail': (context) {
          final budget = ModalRoute.of(context)?.settings.arguments as Budget?;
          if (budget == null) return LoginScreen();
          return BudgetDetailScreen(budget: budget);
        },
        '/budget/compare': (context) {
          final user = FirebaseAuth.instance.currentUser;
          final budget = ModalRoute.of(context)?.settings.arguments as Budget?;
          if (user == null || budget == null) return LoginScreen();
          return BudgetCompareScreen(
            budget: budget,
            budgetService: BudgetService(userId: user.uid),
          );
        },
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
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        // Estilo dos botões de ação flutuante
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          elevation: 4,
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
