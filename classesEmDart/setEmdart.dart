void main() {
  // Exemplo básico de Set em Dart
  // Um Set é uma coleção de elementos únicos, ou seja, não permite duplicatas.
  Set<int> numeros = {1, 2, 3, 4, 5};
  print('Set básico: $numeros'); // Saída: {1, 2, 3, 4, 5}

  // Adicionando elementos a um Set
  numeros.add(6);
  print('Após adicionar 6: $numeros'); // Saída: {1, 2, 3, 4, 5, 6}

  // Tentando adicionar um elemento duplicado
  numeros.add(3);
  print(
      'Após tentar adicionar 3 novamente: $numeros'); // Saída: {1, 2, 3, 4, 5, 6}

  // Removendo elementos de um Set
  numeros.remove(2);
  print('Após remover 2: $numeros'); // Saída: {1, 3, 4, 5, 6}

  // Verificando se um elemento está presente no Set
  bool contemQuatro = numeros.contains(4);
  print('Contém 4? $contemQuatro'); // Saída: true

  // Exemplo avançado de Set em Dart
  // Operações de união, interseção e diferença
  Set<int> setA = {1, 2, 3, 4, 5};
  Set<int> setB = {4, 5, 6, 7, 8};

  // União: combina todos os elementos de ambos os sets, sem duplicatas
  Set<int> uniao = setA.union(setB);
  print('União de setA e setB: $uniao'); // Saída: {1, 2, 3, 4, 5, 6, 7, 8}

  // Interseção: retorna apenas os elementos que estão presentes em ambos os sets
  Set<int> intersecao = setA.intersection(setB);
  print('Interseção de setA e setB: $intersecao'); // Saída: {4, 5}

  // Diferença: retorna os elementos que estão em setA, mas não em setB
  Set<int> diferenca = setA.difference(setB);
  print('Diferença de setA e setB: $diferenca'); // Saída: {1, 2, 3}

  // Convertendo um Set para uma Lista
  List<int> listaDeSet = numeros.toList();
  print('Lista convertida de Set: $listaDeSet'); // Saída: [1, 3, 4, 5, 6]

  // Iterando sobre os elementos de um Set
  print('Iterando sobre os elementos do Set:');
  for (int numero in numeros) {
    print(numero);
  }
  // Saída:
  // 1
  // 3
  // 4
  // 5
  // 6
}

// Neste exemplo, criamos um Set básico de inteiros e demonstramos como adicionar e 
//remover elementos, verificar a presença de um elemento e iterar sobre os elementos 
//do Set. Em seguida, exploramos operações mais avançadas, como união, interseção e 
//diferença entre dois Sets. Por fim, convertemos um Set em uma Lista e iteramos 
//sobre seus elementos.

// a diferença entre List e Set em Dart é que um List permite elementos duplicados,
// enquanto um Set não permite duplicatas. Isso significa que um Set é ideal para
// armazenar uma coleção de elementos únicos, enquanto um List pode conter elementos
// repetidos. Além disso, um Set não mantém a ordem dos elementos, enquanto um List
// mantém a ordem de inserção dos elementos.
