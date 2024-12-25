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
