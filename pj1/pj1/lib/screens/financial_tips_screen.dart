import 'package:flutter/material.dart';

class FinancialTipsScreen extends StatelessWidget {
  const FinancialTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dicas Importantes'),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCreditCardTips(),
        ],
      ),
    );
  }

  Widget _buildCreditCardTips() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.credit_card,
                    color: Color.fromARGB(255, 123, 21, 141), size: 24),
                SizedBox(width: 8),
                Text(
                  'Uso Inteligente do \n Cartão de Crédito',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildTipItem(
              '1. Controle seus Gastos',
              'O cartão é uma forma de pagamento, não um dinheiro extra. '
                  'Seus gastos nunca devem ultrapassar sua renda. '
                  'Acompanhe sua fatura regularmente e mantenha o controle do orçamento.',
            ),
            _buildTipItem(
              '2. Parcelamento Consciente',
              'Escolha sempre o menor número de parcelas possível e '
                  'prefira opções sem juros. Verifique se as parcelas '
                  'cabem no seu orçamento futuro.',
            ),
            _buildTipItem(
              '3. Segurança é Fundamental',
              'Nunca empreste seu cartão ou compartilhe informações. '
                  'Em caso de perda, bloqueie imediatamente. '
                  'Mantenha suas senhas seguras.',
            ),
            _buildTipItem(
              '4. Aproveite os Benefícios',
              'Utilize os programas de pontos, cashback e descontos. '
                  'Pesquise as vantagens oferecidas pelo seu cartão.',
            ),
            _buildTipItem(
              '5. Concentre seus Gastos',
              'Use poucos cartões para facilitar o controle. '
                  'Antes de contratar, avalie condições e benefícios. '
                  'Concentrar gastos ajuda a acumular mais pontos.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipItem(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 123, 21, 141)),
          ),
          const SizedBox(height: 4),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 8),
          const Divider(),
        ],
      ),
    );
  }
}
