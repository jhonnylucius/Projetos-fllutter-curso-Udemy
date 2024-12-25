void main() {
  final carro = Carro(); // Instanciando a classe Carro

  print(carro.cor); // Carro Branco
  carro.ligar(); // chamando o metodo ligar
  print(carro.estaLigado()); // true
}

class Carro {
  // variaveis = propriedades
  // funções = metodos
  String cor = 'Branco';
  double tamanho = 4.5;

  void ligar() {
    // metodo
    print('Carro ligado');
  }

  bool estaLigado() {
    // metodo
    return true;
  }
}
// // Exemplo de Classe Básica
// // Esta é uma definição de classe simples com um construtor e um método.

// class Animal { // Definição de classe
//   String name; 
//   int age;

//   // Construtor
//   Animal(this.name, this.age); 

//   // Método da classe Animal que imprime uma mensagem 
//   void makeSound() {
//     print('$name makes a sound.');
//   }
// }
// void main() {
//   // Criando uma instância de Animal e chamando o método makeSound
//   Animal dog = Animal('Dog', 3);
//   dog.makeSound(); // Saída: Dog makes a sound.

// }

// // Exemplo de Classe Intermediária
// // Este exemplo demonstra herança e sobrescrita de métodos.

// class Animal { // Definição de classe
//   String name;
//   int age;

//   Animal(this.name, this.age); // Construtor

//   void makeSound() { // Método da classe Animal que imprime uma mensagem
//     print('$name makes a sound.');
//   }
// }

// class Dog extends Animal { // Definição de classe que herda de Animal
//   String breed; // Propriedade específica da classe Dog

//   Dog(String name, int age, this.breed) : super(name, age); // Construtor

//   @override  // Método da classe Dog que sobrescreve o método makeSound da classe Animal
//   void makeSound() {
//     print('$name barks.');
//   }
// }

// void main() { // Função principal
//   Dog myDog = Dog('Buddy', 2, 'Golden Retriever'); // Método da classe Dog que sobrescreve o método makeSound da classe Animal
//   myDog.makeSound(); // Saída: Buddy barks. 
// }

// // Exemplo de Classe Avançada
// // Este exemplo mostra o uso de classes abstratas e interfaces.

// abstract class Animal {
//   String name;
//   int age;

//   Animal(this.name, this.age);

//   void makeSound();
// }

// class Dog extends Animal {
//   String breed;

//   Dog(String name, int age, this.breed) : super(name, age);

//   @override
//   void makeSound() {
//     print('$name barks.');
//   }
// }

// class Cat extends Animal {
//   String color;

//   Cat(String name, int age, this.color) : super(name, age);

//   @override
//   void makeSound() {
//     print('$name meows.');
//   }
// }

// void main() {
//   Dog myDog = Dog('Buddy', 2, 'Golden Retriever');
//   Cat myCat = Cat('Whiskers', 3, 'Black');

//   myDog.makeSound(); // Saída: Buddy barks.
//   myCat.makeSound(); // Saída: Whiskers meows.
// }