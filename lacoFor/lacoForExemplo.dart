void main() {
  // Exemplo 1: Laço for simples
  // Este laço for imprime os números de 0 a 4
  for (int i = 0; i < 5; i++) {
    print('Exemplo 1 - Valor de i: $i');
  }

  // Exemplo 2: Laço for com decremento
  // Este laço for imprime os números de 5 a 1
  for (int i = 5; i > 0; i--) {
    print('Exemplo 2 - Valor de i: $i');
  }

  // Exemplo 3: Laço for com incremento de 2
  // Este laço for imprime os números pares de 0 a 8
  for (int i = 0; i < 10; i += 2) {
    print('Exemplo 3 - Valor de i: $i');
  }

  // Exemplo 4: Laço for com lista
  // Este laço for percorre uma lista de strings e imprime cada elemento
  List<String> frutas = ['Maçã', 'Banana', 'Laranja'];
  for (int i = 0; i < frutas.length; i++) {
    print('Exemplo 4 - Fruta: ${frutas[i]}');
  }

  // Exemplo 5: Laço for-each
  // Este laço for-each percorre uma lista de strings e imprime cada elemento
  for (String fruta in frutas) {
    print('Exemplo 5 - Fruta: $fruta');
  }
}

// Neste exemplo, demonstramos vários exemplos de laços for em Dart.
// Começamos com um laço for simples que imprime os números de 0 a 4.
// Em seguida, mostramos um laço for com decremento que imprime os números de 5 a 1.
// Depois, apresentamos um laço for com incremento de 2 que imprime os números pares de 0 a 8.
// Em seguida, exploramos um laço for que percorre uma lista de strings e imprime cada elemento.
// Por fim, mostramos um laço for-each que percorre a mesma lista de strings e imprime cada elemento.
// Os laços for são úteis para iterar sobre uma sequência de elementos, como números ou elementos de uma lista.
// Eles oferecem flexibilidade para controlar o início, a condição e o incremento/decremento do loop, permitindo
// que você execute um bloco de código repetidamente com base em uma condição específica.
// Os laços for-each são especialmente úteis para percorrer coleções de elementos, como listas, conjuntos e mapas,
// sem a necessidade de controlar explicitamente o índice ou a chave de iteração.
// Eles simplificam a iteração sobre os elementos de uma coleção e tornam o código mais legível e conciso.
// Os laços for-each são especialmente úteis para percorrer coleções de elementos, como listas, conjuntos e mapas,
// sem a necessidade de controlar explicitamente o índice ou a chave de iteração.
