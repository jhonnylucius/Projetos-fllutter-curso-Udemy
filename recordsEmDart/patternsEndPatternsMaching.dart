/// Este exemplo demonstra o uso de pattern matching em Dart, desde o básico até o avançado.
///
// / Função principal que contém vários exemplos de pattern matching:
// / - `if-case` básico para correspondência de padrões.
// / - `switch-case` para correspondência de padrões com strings.
// / - Desestruturação com correspondência de padrões.
// / - Uso de padrões em loops `for`.
// / - Correspondência de padrões avançada com padrões aninhados.
// / - Uso de padrões com classes personalizadas.
// / - Combinação de padrões com operadores lógicos.
void main() {
  // Correspondência de padrões básica com if-case
  var value = 42;
  if (value case int n) {
    print('Matched an integer: $n');
  }

  // Correspondência de padrões com switch-case
  var shape = 'circle';
  switch (shape) {
    case 'circle':
      print('It is a circle');
      break;
    case 'square':
      print('It is a square');
      break;
    default:
      print('Unknown shape');
  }

  // Desestruturação com correspondência de padrões
  var point = (x: 10, y: 20);
  if (point case (x: var x, y: var y)) {
    print('Point coordinates: x=$x, y=$y');
  }

  // Usando padrões em loops for
  var list = [1, 2, 3, 4, 5];
  for (var entry in list.asMap().entries) {
    var index = entry.key;
    var value = entry.value;
    print('Index: $index, Value: $value');
  }

  // Correspondência de padrões avançada com padrões aninhados
  var nestedList = [
    1,
    [2, 3],
    4
  ];
  if (nestedList case [var a, [var b, var c], var d]) {
    print('a=$a, b=$b, c=$c, d=$d');
  }

  // Usando padrões com classes personalizadas
  var person = Person('Alice', 30);
  if (person case Person(name: var name, age: var age)) {
    print('Person name: $name, age: $age');
  }

  // Combinando padrões com operadores lógicos
  var number = 15;
  if (number > 10) {
    print('Matched an integer greater than 10: $number');
  }
}

/// Classe Person que representa uma pessoa com nome e idade.
class Person {
  final String name;
  final int age;

  Person(this.name, this.age);
}
