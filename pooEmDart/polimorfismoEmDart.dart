// Definindo uma classe base chamada Animal
class Animal {
  // Método que será sobrescrito pelas subclasses
  void fazerSom() {
    print("Som de um animal");
  }
}

// Definindo uma subclasse chamada Cachorro que herda de Animal
class Cachorro extends Animal {
  // Sobrescrevendo o método fazerSom para fornecer uma implementação específica para Cachorro
  @override
  void fazerSom() {
    print("Latido");
  }
}

// Definindo uma subclasse chamada Gato que herda de Animal
class Gato extends Animal {
  // Sobrescrevendo o método fazerSom para fornecer uma implementação específica para Gato
  @override
  void fazerSom() {
    print("Miau");
  }
}

void main() {
  // Criando uma lista de objetos do tipo Animal
  List<Animal> animais = [
    Cachorro(),
    Gato(),
    Animal()
  ]; // Animal() não é possível instanciar

  // Iterando sobre a lista e chamando o método fazerSom para cada objeto
  // Isso demonstra polimorfismo, pois o método fazerSom se comporta de maneira diferente
  // dependendo do tipo real do objeto (Cachorro, Gato ou Animal)
  for (var animal in animais) {
    animal.fazerSom();
  }
}
// explicações
// A classe Animal é uma classe base que define um método fazerSom que será sobrescrito pelas subclasses.
// A classe Cachorro e Gato são subclasses de Animal que sobrescrevem o método fazerSom com implementações específicas para cada tipo de animal.
// Na função main(), criamos uma lista de objetos do tipo Animal que contém instâncias de Cachorro, Gato e Animal.
// Em seguida, iteramos sobre a lista e chamamos o método fazerSom para cada objeto.
// O polimorfismo é demonstrado aqui, pois o método fazerSom se comporta de maneira diferente dependendo do tipo real do objeto (Cachorro, Gato ou Animal).
// Isso permite que diferentes tipos de animais emitam sons diferentes, mesmo que todos sejam tratados como objetos do tipo Animal na lista.
// A saída do programa será:
// Latido
// Miau
// Som de um animal
// Isso demonstra como o polimorfismo pode ser usado para tratar objetos de diferentes subclasses de forma genérica, permitindo que métodos se comportem de maneira diferente com base no tipo real do objeto.
// O polimorfismo é uma característica fundamental da programação orientada a objetos que permite que objetos de diferentes classes sejam tratados de maneira uniforme.
// Isso promove a reutilização de código e a flexibilidade no design de software, permitindo que diferentes implementações de métodos sejam usadas com base no tipo real do objeto.
// O polimorfismo é uma das principais vantagens da programação orientada a objetos e é amplamente utilizado em muitos sistemas de software para criar hierarquias de classes flexíveis e extensíveis.
// Em resumo, o polimorfismo é uma característica poderosa da programação orientada a objetos que permite que métodos se comportem de maneira diferente com base no tipo real do objeto, promovendo a reutilização de código e a flexibilidade no design de software.
