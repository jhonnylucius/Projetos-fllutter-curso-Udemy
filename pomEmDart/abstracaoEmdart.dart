// Exemplo básico de abstração em Dart

// Classe abstrata Animal
abstract class Animal {
  // Método abstrato que deve ser implementado pelas subclasses
  void fazerSom();
}

// Classe Cachorro que estende a classe abstrata Animal
class Cachorro extends Animal {
  // Implementação do método abstrato
  @override
  void fazerSom() {
    print('O cachorro faz: Au Au');
  }
}

// Classe Gato que estende a classe abstrata Animal
class Gato extends Animal {
  // Implementação do método abstrato
  @override
  void fazerSom() {
    print('O gato faz: Miau');
  }
}

void main() {
  // Criando instâncias das subclasses
  Animal cachorro = Cachorro();
  Animal gato = Gato();

  // Chamando o método fazerSom para cada instância
  cachorro.fazerSom(); // Saída: O cachorro faz: Au Au
  gato.fazerSom(); // Saída: O gato faz: Miau
}

// Exemplo intermediário de abstração em Dart

// Classe abstrata Veiculo
// abstract class Veiculo {
//   // Propriedades comuns a todos os veículos
//   String marca;
//   String modelo;

//   // Construtor
//   Veiculo(this.marca, this.modelo);

//   // Método abstrato que deve ser implementado pelas subclasses
//   void acelerar();
// }

// // Classe Carro que estende a classe abstrata Veiculo
// class Carro extends Veiculo {
//   // Propriedade específica do carro
//   int numeroDePortas;

//   // Construtor
//   Carro(String marca, String modelo, this.numeroDePortas)
//       : super(marca, modelo);

//   // Implementação do método abstrato
//   @override
//   void acelerar() {
//     print('O carro $marca $modelo está acelerando com $numeroDePortas portas.');
//   }
// }

// // Classe Moto que estende a classe abstrata Veiculo
// class Moto extends Veiculo {
//   // Propriedade específica da moto
//   bool temSidecar;

//   // Construtor
//   Moto(String marca, String modelo, this.temSidecar) : super(marca, modelo);

//   // Implementação do método abstrato
//   @override
//   void acelerar() {
//     print(
//         'A moto $marca $modelo está acelerando${temSidecar ? ' com sidecar' : ''}.');
//   }
// }

// void main() {
//   // Criando instâncias das subclasses
//   Veiculo carro = Carro('Toyota', 'Corolla', 4);
//   Veiculo moto = Moto('Harley-Davidson', 'Sportster', false);

//   // Chamando o método acelerar para cada instância
//   carro
//       .acelerar(); // Saída: O carro Toyota Corolla está acelerando com 4 portas.
//   moto.acelerar(); // Saída: A moto Harley-Davidson Sportster está acelerando.
// }

// // Exemplo avançado de abstração em Dart

// // Classe abstrata Funcionario
// // abstract class Funcionario {
// //   // Propriedades comuns a todos os funcionários
// //   String nome;
// //   double salario;

// //   // Construtor
// //   Funcionario(this.nome, this.salario);

// //   // Método abstrato que deve ser implementado pelas subclasses
// //   void calcularBonus();
// // }

// // // Classe Gerente que estende a classe abstrata Funcionario
// // class Gerente extends Funcionario {
// //   // Propriedade específica do gerente
// //   double bonusAnual;

// //   // Construtor
// //   Gerente(String nome, double salario, this.bonusAnual) : super(nome, salario);

// //   // Implementação do método abstrato
// //   @override
// //   void calcularBonus() {
// //     double bonus = salario * 0.1 + bonusAnual;
// //     print('O gerente $nome tem um bônus de R\$ $bonus.');
// //   }
// // }

// // // Classe Desenvolvedor que estende a classe abstrata Funcionario
// // class Desenvolvedor extends Funcionario {
// //   // Propriedade específica do desenvolvedor
// //   int linhasDeCodigoPorDia;

// //   // Construtor
// //   Desenvolvedor(String nome, double salario, this.linhasDeCodigoPorDia)
// //       : super(nome, salario);

// //   // Implementação do método abstrato
// //   @override
// //   void calcularBonus() {
// //     double bonus = salario * 0.05 + linhasDeCodigoPorDia * 0.1;
// //     print('O desenvolvedor $nome tem um bônus de R\$ $bonus.');
// //   }
// // }

// // void main() {
// //   // Criando instâncias das subclasses
// //   Funcionario gerente = Gerente('Alice', 10000, 5000);
// //   Funcionario desenvolvedor = Desenvolvedor('Bob', 8000, 100);

// //   // Chamando o método calcularBonus para cada instância
// //   gerente.calcularBonus(); // Saída: O gerente Alice tem um bônus de R$ 6000.
// //   desenvolvedor
// //       .calcularBonus(); // Saída: O desenvolvedor Bob tem um bônus de R$ 850.
// // }
