// Importando as bibliotecas necessárias
import 'dart:convert'; // Para converter JSON

import 'package:http/http.dart' as http; // Para fazer requisições HTTP

// Função principal assíncrona
void main() async {
  try {
    // Define a URL da API que vamos consultar
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');

    // Faz a requisição GET e aguarda a resposta
    // await é usado para esperar a conclusão da operação assíncrona
    final response = await http.get(url);

    // Verifica se a requisição foi bem sucedida (código 200)
    if (response.statusCode == 200) {
      // Imprime o status da resposta
      print('Status da resposta: ${response.statusCode}');

      // Converte o JSON recebido para uma estrutura de dados Dart
      final List<dynamic> users = json.decode(response.body);

      // Imprime cada usuário formatado
      print('\nLista de Usuários:');
      for (var user in users) {
        print('\nNome: ${user['name']}');
        print('Email: ${user['email']}');
        print('Empresa: ${user['company']['name']}');
        print('------------------------');
      }
    } else {
      // Caso a requisição falhe, imprime o código de erro
      print('Falha na requisição. Status: ${response.statusCode}');
    }
  } catch (e) {
    // Captura e imprime qualquer erro que ocorra durante a execução
    print('Erro ao fazer a requisição: $e');
  }
}

/* Explicações detalhadas:
 * 1. async/await: Permite trabalhar com operações assíncronas de forma síncrona
 * 2. Uri.parse(): Converte uma string URL em um objeto Uri que o http.get aceita
 * 3. try/catch: Trata possíveis erros durante a execução
 * 4. response.statusCode: Código HTTP da resposta (200 = sucesso)
 * 5. json.decode(): Converte a string JSON em objetos Dart
 * 6. List<dynamic>: Tipo da lista retornada pela API
 * 7. For in: Itera sobre cada usuário da lista
 */
