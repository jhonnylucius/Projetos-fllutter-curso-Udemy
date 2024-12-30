// // Definindo uma extensão básica em Dart
// extension StringExtension on String {
//   // Método para capitalizar a primeira letra de uma string
//   String capitalize() {
//     if (this.isEmpty) {
//       return this;
//     }
//     return this[0].toUpperCase() + this.substring(1);
//   }
// }

// void main() {
//   String texto = "ola mundo";
//   print(texto.capitalize()); // Saída: Ola mundo
// }

// Definindo uma extensão intermediária em Dart
// extension ListExtension<T> on List<T> {
//   // Método para obter o segundo elemento da lista
//   T? secondElement() {
//     if (this.length < 2) {
//       return null;
//     }
//     return this[1];
//   }
// }

// void main() {
//   List<int> numeros = [1, 2, 3, 4];
//   print(numeros.secondElement()); // Saída: 2
// }

// Definindo uma extensão avançada em Dart
extension DateTimeExtension on DateTime {
  // Método para formatar a data em uma string legível
  String format() {
    return "${this.day}/${this.month}/${this.year}";
  }

  // Método para calcular a diferença em dias entre duas datas
  int daysDifference(DateTime other) {
    return this.difference(other).inDays;
  }
}

void main() {
  DateTime hoje = DateTime.now();
  DateTime natal = DateTime(2023, 12, 25);

  print(hoje.format()); // Saída: data atual formatada (ex: 14/10/2023)
  print(hoje.daysDifference(natal)); // Saída: diferença em dias até o Natal
}

// // Explicações
// // 1. As extensões em Dart permitem adicionar novos métodos a tipos existentes
// // sem modificar diretamente o código fonte desses tipos.
// // 2. As extensões são úteis para adicionar funcionalidades específicas a tipos
// // existentes sem a necessidade de herança ou modificação direta dos tipos.
// // 3. As extensões podem ser definidas em tipos primitivos, como String, List, DateTime, etc.
// // 4. As extensões podem conter métodos, getters, setters e propriedades computadas.
// // 5. As extensões são uma forma de adicionar funcionalidades de forma modular e reutilizável.
// // 6. As extensões são uma adição recente ao Dart e são uma alternativa ao uso de classes de utilitário.
// // 7. As extensões são uma maneira elegante de estender a funcionalidade de tipos existentes em Dart.
// // 8. As extensões podem ser usadas para melhorar a legibilidade e a expressividade do código.
// // 9. As extensões são uma ferramenta poderosa para adicionar funcionalidades específicas a tipos existentes.
// // 10. As extensões são uma forma de adicionar métodos a tipos sem herança ou modificação direta dos tipos.
// // 11. As extensões são uma maneira de adicionar funcionalidades sem poluir a interface dos tipos existentes.
// // 12. As extensões são uma forma de adicionar métodos a tipos sem criar subclasses ou modificar os tipos existentes.
// // 13. As extensões são uma maneira de adicionar funcionalidades de forma modular e reutilizável em Dart.
// // 14. As extensões são uma forma de adicionar funcionalidades específicas a tipos existentes de forma elegante e concisa.
// 15. As extensões são uma maneira de adicionar funcionalidades específicas a tipos existentes sem modificar diretamente o código fonte desses tipos.
