void main() {
  // Criando uma lista básica de inteiros
  List<int> numeros = [1, 2, 3, 4, 5];
  print('Lista inicial: $numeros');

  // Adicionando um elemento à lista
  numeros.add(6);
  print('Após adicionar 6: $numeros');

  // Adicionando múltiplos elementos à lista
  numeros.addAll([7, 8, 9]);
  print('Após adicionar 7, 8, 9: $numeros');

  // Inserindo um elemento em uma posição específica
  numeros.insert(0, 0);
  print('Após inserir 0 na posição 0: $numeros');

  // Removendo um elemento da lista
  numeros.remove(3);
  print('Após remover o número 3: $numeros');

  // Removendo um elemento em uma posição específica
  numeros.removeAt(0);
  print('Após remover o elemento na posição 0: $numeros');

  // Acessando um elemento pelo índice
  int primeiroElemento = numeros[0];
  print('Primeiro elemento: $primeiroElemento');

  // Modificando um elemento pelo índice
  numeros[0] = 10;
  print('Após modificar o primeiro elemento para 10: $numeros');

  // Verificando se a lista contém um elemento
  bool contemCinco = numeros.contains(5);
  print('A lista contém o número 5? $contemCinco');

  // Obtendo o tamanho da lista
  int tamanho = numeros.length;
  print('Tamanho da lista: $tamanho');

  // Iterando sobre os elementos da lista
  print('Iterando sobre a lista:');
  for (int numero in numeros) {
    print(numero);
  }

  // Usando o método `map` para transformar os elementos da lista
  List<int> numerosDobrados = numeros.map((numero) => numero * 2).toList();
  print('Lista com elementos dobrados: $numerosDobrados');

  // Usando o método `where` para filtrar os elementos da lista
  List<int> numerosPares = numeros.where((numero) => numero % 2 == 0).toList();
  print('Lista com elementos pares: $numerosPares');

  // Usando o método `reduce` para reduzir a lista a um único valor
  int soma = numeros.reduce((a, b) => a + b);
  print('Soma de todos os elementos: $soma');

  // Usando o método `fold` para reduzir a lista a um único valor com um valor inicial
  int produto = numeros.fold(1, (a, b) => a * b);
  print('Produto de todos os elementos: $produto');

  // Ordenando a lista
  numeros.sort();
  print('Lista ordenada: $numeros');

  // Revertendo a lista
  List<int> numerosRevertidos = numeros.reversed.toList();
  print('Lista revertida: $numerosRevertidos');
}

// explicações
// Listas em Dart
// Em Dart, uma lista é uma coleção ordenada de elementos que podem ser acessados por um índice.
//As listas em Dart são representadas pela classe List<T>, onde T é o tipo dos elementos da lista.
//As listas em Dart são semelhantes a arrays em outras linguagens de programação.
//Este exemplo demonstra como criar, modificar e acessar elementos de uma lista em Dart.
// Você pode experimentar esses exemplos e explorar mais sobre listas em Dart.
// Referência: https://api.dart.dev/stable/2.14.4/dart-core/List-class.html
// Referência: https://dart.dev/guides/libraries/library-tour#dartcore---built-in-types-and-functions
// Referência: https://dart.dev/guides/language/language-tour#lists
// Referência: https://dart.dev/guides/language/language-tour#iterables
// Referência: https://dart.dev/guides/language/language-tour#maps
// Referência: https://dart.dev/guides/language/language-tour#sets
// Referência: https://dart.dev/guides/language/language-tour#generics
// Referência: https://dart.dev/guides/language/language-tour#functions
// Referência: https://dart.dev/guides/language/language-tour#control-flow-statements
// Referência: https://dart.dev/guides/language/language-tour#exceptions
// Referência: https://dart.dev/guides/language/language-tour#classes
// Referência: https://dart.dev/guides/language/language-tour#constructors
// Referência: https://dart.dev/guides/language/language-tour#methods
// Referência: https://dart.dev/guides/language/language-tour#inheritance
// Referência: https://dart.dev/guides/language/language-tour#abstract-classes
// Referência: https://dart.dev/guides/language/language-tour#interfaces
// Referência: https://dart.dev/guides/language/language-tour#mixin
// Referência: https://dart.dev/guides/language/language-tour#generics
// Referência: https://dart.dev/guides/language/language-tour#asynchrony-support
// Referência: https://dart.dev/guides/language/language-tour#generators
// Referência: https://dart.dev/guides/language/language-tour#null-aware-operators
// Referência: https://dart.dev/guides/language/language-tour#extension-methods
// Referência: https://dart.dev/guides/language/language-tour#top-level-variables
// Referência: https://dart.dev/guides/language/language-tour#top-level-functions
// Referência: https://dart.dev/guides/language/language-tour#enumerations
// Referência: https://dart.dev/guides/language/language-tour#libraries-and-visibility
// Referência: https://dart.dev/guides/language/language-tour#privacy
