// Encapsulamento básico em Dart

class Pessoa {
  // Atributos privados
  String _nome;
  int _idade;

  // Construtor
  Pessoa(this._nome, this._idade);

  // Métodos getters e setters para acessar e modificar os atributos privados
  String get nome => _nome;
  set nome(String nome) => _nome = nome;

  int get idade => _idade;
  set idade(int idade) => _idade = idade;
}

void main() {
  Pessoa pessoa = Pessoa('João', 30);
  print('Nome: ${pessoa.nome}, Idade: ${pessoa.idade}');

  pessoa.nome = 'Maria';
  pessoa.idade = 25;
  print('Nome: ${pessoa.nome}, Idade: ${pessoa.idade}');
}

// // Encapsulamento avançado em Dart (descomente este bloco e comente o anterior para testes)

// class ContaBancaria {
//   // Atributos privados
//   String _titular;
//   double _saldo;

//   // Construtor
//   ContaBancaria(this._titular, this._saldo);

//   // Método getter para acessar o saldo (somente leitura)
//   double get saldo => _saldo;

//   // Método para depositar dinheiro na conta
//   void depositar(double valor) {
//     if (valor > 0) {
//       _saldo += valor;
//       print('Depósito de R\$ $valor realizado com sucesso.');
//     } else {
//       print('Valor de depósito inválido.');
//     }
//   }

//   // Método para sacar dinheiro da conta
//   void sacar(double valor) {
//     if (valor > 0 && valor <= _saldo) {
//       _saldo -= valor;
//       print('Saque de R\$ $valor realizado com sucesso.');
//     } else {
//       print('Valor de saque inválido ou saldo insuficiente.');
//     }
//   }
// }

// void main() {
//   ContaBancaria conta = ContaBancaria('Ana', 1000.0);
//   print('Saldo inicial: R\$ ${conta.saldo}');

//   conta.depositar(500.0);
//   print('Saldo após depósito: R\$ ${conta.saldo}');

//   conta.sacar(300.0);
//   print('Saldo após saque: R\$ ${conta.saldo}');

//   conta.sacar(1500.0); // Tentativa de saque inválido
// }

// explicações
// O encapsulamento é uma técnica fundamental na programação orientada a objetos que permite proteger os atributos de uma classe e controlar o acesso a eles por meio de métodos getters e setters.
// Em Dart, o encapsulamento pode ser implementado usando atributos privados (que começam com _), métodos getters e setters para acessar e modificar esses atributos e métodos públicos para realizar operações na classe.
// No exemplo básico, a classe Pessoa possui atributos privados _nome e _idade, métodos getters e setters para acessar e modificar esses atributos e um construtor que inicializa esses atributos.
// Na função main(), criamos uma instância da classe Pessoa, acessamos e modificamos os atributos privados usando os métodos getters e setters e exibimos os valores atualizados.
// No exemplo avançado, a classe ContaBancaria possui atributos privados _titular e _saldo, um método getter para acessar o saldo (somente leitura) e métodos para depositar e sacar dinheiro da conta.
// Os métodos depositar() e sacar() verificam se o valor é válido e atualizam o saldo da conta de acordo com a operação realizada.
// Na função main(), criamos uma instância da classe ContaBancaria, realizamos operações de depósito e saque e exibimos o saldo atualizado após cada operação.
// O encapsulamento é uma prática importante na programação orientada a objetos, pois ajuda a manter a integridade dos dados e a controlar o acesso aos atributos de uma classe.
// Isso ajuda a evitar erros e inconsistências no código, promovendo uma melhor organização e manutenção do software.
// Em resumo, o encapsulamento é uma técnica fundamental na programação orientada a objetos que permite proteger os atributos de uma classe e controlar o acesso a eles por meio de métodos getters e setters.
