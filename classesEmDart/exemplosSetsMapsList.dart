void main() {
  // Exemplo básico de manipulação de Set
  Set<int> numeros = {1, 2, 3, 4, 5};
  numeros.add(6); // Adiciona um elemento ao Set
  numeros.remove(3); // Remove um elemento do Set
  print('Set de números: $numeros'); // Saída: {1, 2, 4, 5, 6}

  // Convertendo Set para List
  List<int> listaNumeros = numeros.toList();
  print('Lista de números: $listaNumeros'); // Saída: [1, 2, 4, 5, 6]

  // Exemplo básico de manipulação de Map
  Map<String, int> idadePessoas = {'Alice': 25, 'Bob': 30, 'Charlie': 35};
  idadePessoas['David'] = 40; // Adiciona um novo par chave-valor ao Map
  idadePessoas.remove('Alice'); // Remove um par chave-valor do Map
  print(
      'Mapa de idades: $idadePessoas'); // Saída: {Bob: 30, Charlie: 35, David: 40}

  // Convertendo Map para List de chaves
  List<String> chaves = idadePessoas.keys.toList();
  print('Lista de chaves: $chaves'); // Saída: [Bob, Charlie, David]

  // Convertendo Map para List de valores
  List<int> valores = idadePessoas.values.toList();
  print('Lista de valores: $valores'); // Saída: [30, 35, 40]

  // Exemplo avançado de manipulação de Set e Map
  Set<String> frutas = {'maçã', 'banana', 'laranja'};
  Map<String, int> estoqueFrutas = {for (var fruta in frutas) fruta: 10};
  print(
      'Estoque de frutas: $estoqueFrutas'); // Saída: {maçã: 10, banana: 10, laranja: 10}

  // Atualizando valores no Map com base em um Set
  Set<String> frutasVendidas = {'maçã', 'banana'};
  for (var fruta in frutasVendidas) {
    if (estoqueFrutas.containsKey(fruta)) {
      estoqueFrutas[fruta] = estoqueFrutas[fruta]! - 1;
    }
  }
  print(
      'Estoque atualizado de frutas: $estoqueFrutas'); // Saída: {maçã: 9, banana: 9, laranja: 10}
}

// Neste exemplo, demonstramos a manipulação básica de Set e Map em Dart.
// Criamos um Set de números inteiros e um Map de idades de pessoas, adicionamos
// e removemos elementos, e convertemos Set e Map para List.
// Em seguida, exploramos operações mais avançadas, como criar um Map a partir de um Set,
// atualizar valores no Map com base em um Set e imprimir os resultados.
// Ambos Set e Map são estruturas de dados poderosas e versáteis em Dart, que podem ser
// usadas em uma variedade de cenários de programação.
