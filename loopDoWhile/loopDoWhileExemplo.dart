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
