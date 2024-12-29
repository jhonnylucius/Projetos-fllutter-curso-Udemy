void main() {
  String? nome =
      null; // no dart null se usa com muito cuidado pois pode gerar erros
  nome = 'Luciano'; // apenas usar se realmente a variavel pode ser nula

  print(nome);
}

// Neste exemplo, definimos um enum básico chamado Status com os valores pending, approved e rejected.
// Em seguida, declaramos uma variável status do tipo Status e a inicializamos com o valor Status.pending.
// Usamos uma instrução switch para verificar o valor da variável status e imprimir uma mensagem correspondente.
