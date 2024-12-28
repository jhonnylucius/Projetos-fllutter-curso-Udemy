void main() {
  // Exemplo básico de Map
  Map<String, int> idadeDasPessoas = {
    'Alice': 25,
    'Bob': 30,
    'Charlie': 35,
  };

  // Acessando valores no Map
  print(
      'Idade da Alice: ${idadeDasPessoas['Alice']}'); // Saída: Idade da Alice: 25

  // Adicionando um novo par chave-valor
  idadeDasPessoas['David'] = 40;
  print(
      'Idade do David: ${idadeDasPessoas['David']}'); // Saída: Idade do David: 40

  // Atualizando um valor existente
  idadeDasPessoas['Alice'] = 26;
  print(
      'Nova idade da Alice: ${idadeDasPessoas['Alice']}'); // Saída: Nova idade da Alice: 26

  // Removendo um par chave-valor
  idadeDasPessoas.remove('Bob');
  print(
      'Idade das pessoas após remover Bob: $idadeDasPessoas'); // Saída: Idade das pessoas após remover Bob: {Alice: 26, Charlie: 35, David: 40}

  // Iterando sobre um Map
  idadeDasPessoas.forEach((nome, idade) {
    print('$nome tem $idade anos');
  });
  // Saída:
  // Alice tem 26 anos
  // Charlie tem 35 anos
  // David tem 40 anos

  // Exemplo avançado de Map com valores complexos
  Map<String, List<String>> hobbiesDasPessoas = {
    'Alice': ['Leitura', 'Caminhada'],
    'Bob': ['Ciclismo', 'Xadrez'],
    'Charlie': ['Fotografia', 'Cozinhar'],
  };

  // Acessando e manipulando valores complexos
  hobbiesDasPessoas['Alice']?.add('Pintura');
  print(
      'Hobbies da Alice: ${hobbiesDasPessoas['Alice']}'); // Saída: Hobbies da Alice: [Leitura, Caminhada, Pintura]

  // Iterando sobre um Map com valores complexos
  hobbiesDasPessoas.forEach((nome, hobbies) {
    print('$nome gosta de:');
    hobbies.forEach((hobby) {
      print('- $hobby');
    });
  });
  // Saída:
  // Alice gosta de:
  // - Leitura
  // - Caminhada
  // - Pintura
  // Bob gosta de:
  // - Ciclismo
  // - Xadrez
  // Charlie gosta de:
  // - Fotografia
  // - Cozinhar

  // Usando Map para contar ocorrências
  String texto =
      'Dart é uma linguagem de programação. Dart é fácil de aprender.';
  Map<String, int> contagemDePalavras = {};

  texto.split(' ').forEach((palavra) {
    palavra = palavra.replaceAll(RegExp(r'[^\w\s]'), ''); // Remove pontuação
    if (contagemDePalavras.containsKey(palavra)) {
      contagemDePalavras[palavra] = contagemDePalavras[palavra]! + 1;
    } else {
      contagemDePalavras[palavra] = 1;
    }
  });

  print('Contagem de palavras: $contagemDePalavras');
  // Saída: Contagem de palavras: {Dart: 2, é: 2, uma: 1, linguagem: 1, de: 2, programação: 1, fácil: 1, aprender: 1}
}

// Neste exemplo, criamos um Map básico que mapeia nomes de pessoas para suas idades.
// Demonstramos como acessar, adicionar, atualizar e remover pares chave-valor no Map,
// bem como iterar sobre os elementos. Em seguida, exploramos um Map mais complexo que
// mapeia nomes de pessoas para listas de hobbies. Demonstramos como acessar e manipular
// valores complexos, bem como iterar sobre eles. Por fim, usamos um Map para contar as
// ocorrências de palavras em um texto, removendo a pontuação e tratando as palavras
// como chaves no Map.
