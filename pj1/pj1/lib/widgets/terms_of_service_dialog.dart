import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class TermsOfServiceDialog extends StatelessWidget {
  const TermsOfServiceDialog({super.key});

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
              onTap: () =>
                  _launchURL('https://union.dev.br/termosAgendaPro.html'),
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
            Navigator.of(context).pop(true);
          },
        ),
        TextButton(
          child: Text('Recusar'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }

  void _launchURL(String url) async {
    if (await url_launcher.canLaunchUrl(Uri.parse(url))) {
      await url_launcher.launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
