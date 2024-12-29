void main() {
  // function
  String plataforma = 'union.dev.br';
  printMelhorPlataforma(
      plataforma: plataforma,
      versao: 1.0,
      inscritos: 100000); // Melhor plataforma: union.dev.br
}

// function main ends with a call to printMelhorPlataforma
void printMelhorPlataforma(
    {required String plataforma,
    required double versao,
    required int inscritos}) {
  plataforma = 'Melhor plataforma $plataforma + $versao + $inscritos';
  print(plataforma); // Melhor plataforma: union.dev.br
}

// explicações
// Neste exemplo, declaramos uma função chamada printMelhorPlataforma que aceita três parâmetros nomeados: plataforma, versao e inscritos.
// Os parâmetros nomeados são definidos entre chaves {} e são precedidos pelo nome do parâmetro e seu tipo.
// Os parâmetros nomeados são opcionais e podem ser fornecidos em qualquer ordem ao chamar a função.
// No método main, criamos uma variável plataforma e chamamos a função printMelhorPlataforma com os parâmetros nomeados plataforma, versao e inscritos.
// A função printMelhorPlataforma imprime a mensagem 'Melhor plataforma: union.dev.br' com os valores fornecidos para os parâmetros nomeados.
// Os parâmetros nomeados são úteis para tornar o código mais legível e permitir que os argumentos sejam fornecidos em qualquer ordem.
// Os parâmetros nomeados são opcionais e podem ter valores padrão, se necessário.
