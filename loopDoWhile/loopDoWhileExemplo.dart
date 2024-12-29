void main() {
  // Exemplo básico de do-while
  int contador = 0;
  do {
    print('Contador: $contador');
    contador++;
  } while (contador < 5);

  // Exemplo intermediário de do-while com condição complexa
  int numero = 10;
  do {
    print('Número: $numero');
    numero -= 2;
  } while (numero > 0);

  // Exemplo avançado de do-while com entrada do usuário
  // import 'dart:io';

  // String? input;
  // do {
  //   print('Digite "sair" para encerrar o loop:');
  //   input = stdin.readLineSync();
  // } while (input != 'sair');

  // Exemplo avançado de do-while com múltiplas condições
  int a = 0;
  int b = 10;
  do {
    print('a: $a, b: $b');
    a++;
    b--;
  } while (a < 5 && b > 5);
}

// Neste exemplo, demonstramos o uso do loop do-while em Dart.
// Começamos com um exemplo básico de um contador simples, onde o loop é executado
// pelo menos uma vez, mesmo se a condição for falsa.
// Em seguida, mostramos um exemplo intermediário com uma condição mais complexa,
// onde o loop é executado enquanto o número for maior que zero.
// Por fim, apresentamos um exemplo avançado com entrada do usuário e múltiplas condições,
// onde o loop é executado até que o usuário digite "sair" e ambas as condições sejam atendidas.
// O loop do-while é útil quando você deseja executar um bloco de código pelo menos uma vez
// e, em seguida, continuar a executá-lo com base em uma condição específica.
// Ele é semelhante ao loop while, mas garante que o bloco de código seja executado pelo menos uma vez.
// O loop do-while é útil quando você deseja executar um bloco de código pelo menos uma vez
// e, em seguida, continuar a executá-lo com base em uma condição específica.
