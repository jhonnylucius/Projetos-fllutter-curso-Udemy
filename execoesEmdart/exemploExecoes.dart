// exemploExecoes.dart

void main() {
  // Exemplo de tratamento de erro usando try-catch
  try {
    int result = 10 ~/ 0; // Isso causará uma exceção de divisão por zero
    print(result);
  } catch (e) {
    print('Erro: $e'); // Captura e imprime a exceção
  }

  // Exemplo de tratamento de erro usando try-catch-finally
  try {
    int result = 10 ~/ 2;
    print(result);
  } catch (e) {
    print('Erro: $e');
  } finally {
    print('Bloco finally executado'); // Este bloco sempre será executado
  }

  // Exemplo de tratamento de erro usando on-catch
  try {
    int result = 10 ~/ 0;
    print(result);
  } on UnsupportedError catch (e) {
    print('Erro de divisão por zero: $e'); // Captura exceções específicas
  } catch (e) {
    print('Erro: $e'); // Captura qualquer outra exceção
  }

  // Exemplo de lançamento de exceção personalizada
  try {
    validarIdade(-5);
  } catch (e) {
    print('Erro: $e');
  }
}

// Função que lança uma exceção personalizada
void validarIdade(int idade) {
  if (idade < 0) {
    throw ArgumentError(
        'A idade não pode ser negativa'); // Lança uma exceção personalizada
  }
}

// Exemplo de uso de Future e tratamento de erro assíncrono
Future<void> exemploAssincrono() async {
  try {
    await Future.delayed(Duration(seconds: 1));
    throw Exception('Erro assíncrono'); // Lança uma exceção assíncrona
  } catch (e) {
    print('Erro assíncrono: $e'); // Captura a exceção assíncrona
  }
}
// Explicações:
// - O bloco try-catch é usado para capturar exceções e lidar com erros em Dart.
// - O bloco try-catch-finally é semelhante ao bloco try-catch, mas o bloco finally 
// é executado independentemente de ocorrer uma exceção.
// - O bloco on-catch é usado para capturar exceções específicas, permitindo que você
// trate diferentes tipos de erros de forma personalizada.
// - Você também pode lançar exceções personalizadas usando a palavra-chave throw.
// - O uso de exceções personalizadas pode ajudar a tornar o código mais legível e expressivo.
// - O código assíncrono pode lançar exceções que podem ser capturadas usando blocos try-catch.
// - O uso de Future e async/await permite lidar com exceções em operações assíncronas de forma eficaz.
// - O tratamento de exceções é uma prática importante para lidar com erros e garantir a robustez do código.

