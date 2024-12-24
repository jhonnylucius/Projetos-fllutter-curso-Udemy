void main() {
  // Exemplo de função simples
  void saudar() {
    print('Olá, mundo!');
  }

  saudar(); // Chama a função saudar()

  // Exemplo de função com retorno
  int somar(int a, int b) {
    return a + b;
  }

  int resultado = somar(3, 5);
  print(resultado); // Saída: 8

//   // Exemplo de função com parâmetros opcionais
//   String saudacao(String nome, [String? sobrenome]) {
//     if (sobrenome != null) {
//       return 'Olá, $nome $sobrenome!';
//     } else {
//       return 'Olá, $nome!';
//     }
//   }

//   print(saudacao('Luciano')); // Saída: Olá, Luciano!
//   print(saudacao('Luciano', 'Silva')); // Saída: Olá, Luciano Silva!

//   // Exemplo de função com parâmetros nomeados
//   void mostrarDados({required String nome, int idade = 0}) {
//     print('Nome: $nome, Idade: $idade');
//   }

//   mostrarDados(nome: 'Luciano'); // Saída: Nome: Luciano, Idade: 0
//   mostrarDados(nome: 'Luciano', idade: 30); // Saída: Nome: Luciano, Idade: 30

//   // Exemplo de função anônima
//   var multiplicar = (int a, int b) => a * b;

//   print(multiplicar(5, 3)); // Saída: 15

//   // Exemplo de função de ordem superior
//   void executarFuncao(int a, int b, Function funcao) {
//     print(funcao(a, b));
//   }

//   executarFuncao(3, 4, multiplicar); // Saída: 12

//   // Exemplo de função recursiva
//   int fatorial(int n) {
//     if (n <= 1) return 1;
//     return n * fatorial(n - 1);
//   }

//   print(fatorial(5)); // Saída: 120

//   // Exemplo de função de flecha
//   int quadrado(int n) => n * n;
//   print(quadrado(5)); // Saída: 25

//   // Exemplo de função de flecha com múltiplas expressões
//   int cubo(int n) => n * n * n;
//   print(cubo(5)); // Saída: 125

//   // // Exemplo de função de flecha com chaveamento de método
//   // int potencia(int base, int expoente) => base.pow(expoente);
//   // print(potencia(2, 3)); // Saída: 8

//   // Exemplo de função de flecha com múltiplos parâmetros
//   int adicao(int a, int b) => a + b;
//   print(adicao(3, 4)); // Saída: 7

//   // Exemplo de função lambda
//   Function somarLambda = (int a, int b) => a + b;
//   print(somarLambda(3, 4)); // Saída: 7
//   // Exemplo de função lambda com múltiplas expressões
//   Function subtrairLambda = (int a, int b) {
//     int resultado = a - b;
//     return resultado;
//   };
//   print(subtrairLambda(5, 3)); // Saída: 2
//   // Exemplo de função lambda com chaveamento de método
//   Function multiplicarLambda = (int a, int b) => a * b;
//   print(multiplicarLambda(3, 4)); // Saída: 12
//   // Exemplo de função lambda com múltiplos parâmetros
//   Function dividirLambda = (int a, int b) => a ~/ b;
//   print(dividirLambda(12, 3)); // Saída: 4

//   // Exemplo de função lambda com parâmetros opcionais
//   Function saudacaoLambda = (String nome, [String? sobrenome]) {
//     if (sobrenome != null) {
//       return 'Olá, $nome $sobrenome!';
//     } else {
//       return 'Olá, $nome!';
//     }
//   };
//   print(saudacaoLambda('Luciano')); // Saída: Olá, Luciano!
// }
}
