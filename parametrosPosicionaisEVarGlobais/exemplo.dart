// void main() {
//   // function
//   printMelhorPlataforma('union.dev.br'); // Melhor plataforma: union.dev.br
// }

// // plataforma é um parâmetro posicional
// void printMelhorPlataforma(String plataforma) {
//   print('Melhor plataforma: $plataforma'); // Melhor plataforma: union.dev.br
// }

// exemplo de variavel global abaixo, assim ela pode ser usada em qualquer bloco do codigo

var plataforma = 'union.dev.br'; // variavel global

void main() {
  print(plataforma); // variavel global: variavel global
}

// explicações
// Neste exemplo, declaramos uma variável global chamada plataforma fora de qualquer função ou classe.
// A variável plataforma pode ser acessada e usada em qualquer parte do código,
// incluindo funções e métodos.
// No método main(), imprimimos o valor da variável plataforma, que é 'union.dev.br'.
// Variáveis globais podem ser úteis para armazenar valores que precisam ser
// acessados em vários locais do código.
// No entanto, o uso excessivo de variáveis globais pode tornar o código menos legível
// e mais difícil de manter.
// É importante usar variáveis globais com moderação e considerar outras opções, como
// passar valores como parâmetros para funções ou métodos, quando possível.
// Variáveis globais podem ser úteis para armazenar valores que precisam ser acessados
// em vários locais do código, mas devem ser usadas com moderação para manter o código organizado e legível.
// Variáveis globais podem ser acessadas e usadas em qualquer parte do código, incluindo funções e métodos.
// No entanto, o uso excessivo de variáveis globais pode tornar o código menos legível e mais difícil de manter.
