void main() {
  // Exemplo de laço for usando continue
  for (int i = 0; i < 10; i++) {
    if (i % 2 == 0) {
      continue; // Pula a iteração atual se i for par
    }
    print('For loop usando continue: $i');
  }

  // Exemplo de laço for usando break
  for (int i = 0; i < 10; i++) {
    if (i == 5) {
      break; // Sai do laço quando i for igual a 5
    }
    print('For loop usando break: $i');
  }

  // Exemplo de laço while usando continue
  int j = 0;
  while (j < 10) {
    j++;
    if (j % 2 == 0) {
      continue; // Pula a iteração atual se j for par
    }
    print('While loop usando continue: $j');
  }

  // Exemplo de laço while usando break
  int k = 0;
  while (k < 10) {
    if (k == 5) {
      break; // Sai do laço quando k for igual a 5
    }
    print('While loop usando break: $k');
    k++;
  }
}

/*
Explicação:
- A palavra reservada `continue` é usada para pular a iteração atual do laço e continuar com a próxima iteração. No exemplo, os números pares são pulados.
- A palavra reservada `break` é usada para sair do laço completamente. No exemplo, o laço é interrompido quando o valor atinge 5.
*/
// Neste exemplo, demonstramos como usar as palavras-chave `continue` e `break` em laços for e while em Dart.
