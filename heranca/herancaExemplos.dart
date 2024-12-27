void main() {
  Carro carro = Carro();

  carro.isFarolLigado = true;
  carro.isFucionando = true;
  carro.isFarolLigado = true;
  carro.velocidade = 0; // Atribuindo um valor para a variável velocidade
  print(carro.velocidade); // Imprimindo a velocidade
  carro.printQuantidadePortas(); // Chamando o método printQuantidadePortas
  carro.aumentarVelicidade(); // Chamando o método aumentarVelicidade
  print(carro.velocidade); // Imprimindo a velocidade
  carro.cor = 'Vermelho'; // Atribuindo um valor para a variável cor
  print(carro.cor); // Imprimindo a cor
  bike bicicleta = bike();
  bicicleta.isFarolLigado = true;
  bicicleta.isFucionando = true;
  bicicleta.isFarolLigado = true;
  bicicleta.velocidade = 0; // Atribuindo um valor para a variável velocidade
  print(bicicleta.velocidade); // Imprimindo a velocidade
  bicicleta.printQuantidadePortas(); // Chamando o método printQuantidadePortas
  bicicleta.aumentarVelicidade(); // Chamando o método aumentarVelicidade
  print(bicicleta.velocidade); // Imprimindo a velocidade
  bicicleta.cor = 'Preto'; // Atribuindo um valor para a variável cor
  print(bicicleta.cor); // Imprimindo a cor
}

class Veiculo {
  int velocidade = 10;
  bool isFucionando = true;
  bool isFarolLigado = true;

  void aumentarVelicidade() {
    velocidade += 30;
  }
}

class Carro extends Veiculo {
  int quantidadeDePortas = 4;
  String cor = 'Azul';

  void printQuantidadePortas() {
    print(quantidadeDePortas);
    print(cor);
  }
}

class bike extends Veiculo implements Carro {
  int quantidadeDePortas = 0;
  String _cor = '';

  @override
  String get cor => _cor;

  @override
  set cor(String value) {
    _cor = value;
  }

  @override
  void printQuantidadePortas() {
    print(quantidadeDePortas);
  }
}

//exemplo 2

// void main() {
//   // Função principal
//   Carro carro = Carro('Azul', 2022, 'Sedan');
//   carro.mostrarVeiculo(); // Chamando o método mostrarVeiculo
//   testarVeiculo(); // Chamando o método testarVeiculo

//   veiculo gol = carro;
//   print((gol as Carro).anotherVeiculo);
//   gol.mostrarVeiculo(); // Chamando o método mostrarVeiculo
// }

// class veiculo {
//   // Classe veiculo
//   String cor; // Variável cor
//   int ano; // Variável ano
//   String modelo; // Variável modelo
//   veiculo(this.cor, this.ano, this.modelo); // Constructor
//   void mostrarVeiculo() {
//     // Método mostrarVeiculo
//     print('Cor: $cor, Ano: $ano, Modelo: $modelo');
//   }
// }

// class Carro extends veiculo {
//   // Classe Carro
//   Carro(String cor, int ano, String modelo) : super(cor, ano, modelo);

//   Object? get anotherVeiculo => null; // Constructor do Carro with anotherVeiculo
//   void mostrarVeiculo() {
//     // Método mostrarVeiculo
//     print('Carro - Cor: $cor, Ano: $ano, Modelo: $modelo');
//   }
// }

// class Carro2 extends veiculo {
//   // Classe moto
//   Carro2(String cor, int ano, String modelo)
//       : super(cor, ano, modelo); // Constructor
//   void mostrarVeiculo() {
//     // Método mostrarVeiculo
//     print('Carro2 - Cor: $cor, Ano: $ano, Modelo: $modelo');
//   }
// }

// void testarVeiculo() {
//   // Método testarVeiculo
//   var carro1 = Carro('Preto', 2020, 'Fusca'); // Instanciando a classe Carro
//   var carro2 = Carro2('Vermelha', 2021, 'S10'); // Instanciando a classe moto
//   carro1.mostrarVeiculo(); // Chamando o método mostrarVeiculo
//   carro2.mostrarVeiculo(); // Chamando o método mostrarVeiculo
// }

// // Executando o código
// // Output: Carro - Cor: Preto, Ano: 2020, Modelo: Fusca
// // Carro2 - Cor: Vermelha, Ano: 2021, Modelo: S100
// // O código acima mostra a herança de classes em Dart. A classe veiculo é a classe pai,
// // enquanto as classes carro e moto são classes filhas. A classe pai veiculo possui as variáveis cor, ano e modelo,
// // e o método mostrarVeiculo. As classes filhas carro e moto herdam as variáveis e métodos da classe pai veiculo.
// // O método testarVeiculo cria um objeto da classe carro e um objeto da classe moto, e chama o método mostrarVeiculo de cada objeto.
