// Definindo uma classe abstrata chamada Animal
abstract class Animal {
  // Método abstrato que deve ser implementado pelas subclasses
  void fazerSom();

  // Método concreto que pode ser compartilhado pelas subclasses
  void dormir() {
    print("Dormindo...");
  }
}

// Subclasse que estende a classe abstrata Animal
class Cachorro extends Animal {
  // Implementação do método abstrato
  @override
  void fazerSom() {
    print("Latido");
  }
}

// Outra subclasse que estende a classe abstrata Animal
class Gato extends Animal {
  // Implementação do método abstrato
  @override
  void fazerSom() {
    print("Miau");
  }
}

void main() {
  // Criando instâncias das subclasses
  Cachorro cachorro = Cachorro();
  Gato gato = Gato();

  // Chamando métodos nas instâncias
  cachorro.fazerSom(); // Saída: Latido
  cachorro.dormir(); // Saída: Dormindo...

  gato.fazerSom(); // Saída: Miau
  gato.dormir(); // Saída: Dormindo...
}

// explicações
// A classe Animal é uma classe abstrata, ou seja, não pode ser instanciada diretamente.
// Ela possui um método abstrato fazerSom() que deve ser implementado pelas subclasses.
// A classe Cachorro e Gato são subclasses da classe Animal e implementam o método abstrato fazerSom().
// A classe Animal também possui um método concreto dormir() que pode ser compartilhado pelas subclasses.
// As subclasses Cachorro e Gato estendem a classe Animal e implementam o método abstrato fazerSom().
// Na função main(), criamos instâncias das subclasses Cachorro e Gato e chamamos os métodos fazerSom() e dormir().
// A saída do programa será:
// Latido
// Dormindo...
// Miau
// Dormindo...
// Como a classe Animal é abstrata, não podemos criar instâncias dela diretamente. 
//No entanto, podemos criar instâncias das subclasses Cachorro e Gato e chamamos os métodos fazerSom() e dormir().
// A classe Cachorro implementa o método fazerSom() com a mensagem "Latido" e a classe Gato implementa o método fazerSom() com a mensagem "Miau".
// Ambas as subclasses também herdam o método dormir() da classe Animal, que imprime "Dormindo...".
// Portanto, ao chamar os métodos nas instâncias de Cachorro e Gato, obtemos as saídas esperadas.
// Isso demonstra como as classes abstratas e os métodos abstratos podem ser usados para definir um contrato que as subclasses devem seguir.
// Isso ajuda a garantir que as subclasses implementem os métodos necessários e forneçam uma estrutura consistente para a hierarquia de classes.
// Isso também permite que métodos concretos sejam compartilhados entre as subclasses, evitando a duplicação de código.
// Em resumo, as classes abstratas e os métodos abstratos são uma ferramenta poderosa para definir e implementar hierarquias de classes em Dart.
// Eles fornecem uma maneira de definir um contrato entre classes e garantir que as subclasses sigam esse contrato.
// Isso ajuda a manter o código organizado, reutilizável e fácil de manter.