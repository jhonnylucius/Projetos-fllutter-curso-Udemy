import 'dart:async';

// Função simulando uma operação assíncrona que pode falhar
Future<String> fetchDataFromServer() async {
  // Simulando um atraso na resposta do servidor
  await Future.delayed(Duration(seconds: 2));

  // Simulando uma condição de erro
  bool isError = DateTime.now().second % 2 == 0;
  if (isError) {
    throw Exception('Erro ao buscar dados do servidor');
  }

  // Retornando dados simulados
  return 'Dados do servidor';
}

// Função principal que lida com a operação assíncrona e tratamento de erro
Future<void> main() async {
  try {
    // Tentando buscar dados do servidor
    String data = await fetchDataFromServer();
    print('Dados recebidos: $data');
  } on TimeoutException catch (e) {
    // Tratando erro de timeout
    print('Erro de timeout: $e');
  } on Exception catch (e) {
    // Tratando outros tipos de erro
    print('Erro: $e');
  } catch (e) {
    // Tratando qualquer outro tipo de erro não especificado
    print('Erro inesperado: $e');
  } finally {
    // Código que sempre será executado, independentemente de erro ou sucesso
    print('Operação concluída');
  }
}

// Função que executa a função principal e lida com erros não capturados
void runAppWithErrorHandlingMain() {
  main().catchError((e) {
    print('Erro não capturado: $e');
  });
}

// runAppWithErrorHandlingMain();
// Neste exemplo, criamos uma função fetchDataFromServer que simula uma operação assíncrona que pode falhar.
// A função retorna uma string 'Dados do servidor' se a operação for bem-sucedida e lança uma exceção 'Erro ao buscar dados do servidor' se ocorrer um erro.
// A função main lida com a operação assíncrona fetchDataFromServer e o tratamento de erro usando try-catch.
// Se a operação for bem-sucedida, os dados recebidos são impressos na tela.
// Se ocorrer um erro de TimeoutException, um erro de timeout é tratado.
// Se ocorrer qualquer outro tipo de erro, ele é tratado como uma exceção genérica.
// O bloco finally é executado independentemente de ocorrer um erro ou não.
// A função runAppWithErrorHandlingMain executa a função main e lida com erros não capturados usando catchError.
// Isso garante que qualquer erro não tratado seja capturado e impresso na tela.
// O uso de try-catch e finally é útil para lidar com operações assíncronas e tratamento de erro em Dart.
// Esses blocos permitem que você capture e lide com exceções de forma controlada, garantindo que seu código seja robusto e seguro.
