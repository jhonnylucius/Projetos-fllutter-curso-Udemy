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
