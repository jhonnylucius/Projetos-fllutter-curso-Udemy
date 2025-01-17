import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsOfServiceDialog extends StatelessWidget {
  final VoidCallback onAccepted;
  final VoidCallback onDeclined;

  const TermsOfServiceDialog({
    super.key,
    required this.onAccepted,
    required this.onDeclined,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Termos de Serviço'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
                'Por favor, leia e aceite os termos de serviço para continuar.'),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () => _launchURL(
                  'https://union.dev.br/termosGestorFinanceiro.html'),
              child: Text(
                'Leia os Termos de Serviço',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Aceitar'),
          onPressed: () {
            onAccepted();
            Navigator.of(context).pop(); // Fechar o diálogo
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/login', (route) => false); // Navegar para a tela de login
          },
        ),
        TextButton(
          child: Text('Recusar'),
          onPressed: () {
            onDeclined();
            Navigator.of(context).pop(); // Fechar o diálogo
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/', (route) => false); // Navegar para a tela inicial
          },
        ),
      ],
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
