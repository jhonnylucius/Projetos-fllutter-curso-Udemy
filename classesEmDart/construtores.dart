void main() {
  final gol = Carro(cor: 'azul', tamanho: 3.80); // Instanciando a classe Carro

  print(gol.cor); // Carro Branco
  gol.ligar(); // chamando o metodo ligar
  print(gol.estaLigado()); // true
}

class Carro {
  // variaveis = propriedades
  // funções = metodos
  final String cor;
  final double tamanho;

  Carro(
      {required this.cor,
      required this.tamanho}); // chamando o metodo construtor

  void ligar() {
    // metodo
    print('Carro ligado');
  }

  bool estaLigado() {
    // metodo
    return true;
  }
}

// Neste exemplo, criamos uma classe Carro com propriedades cor e tamanho,
// e métodos ligar e estaLigado.
// A propriedade cor é uma variável final, o que significa que seu valor é definido
// no construtor e não pode ser alterado posteriormente.
// A propriedade tamanho é uma variável final também, que é definida no construtor.
// O método ligar imprime uma mensagem indicando que o carro foi ligado.
// O método estaLigado retorna true, indicando que o carro está ligado.
// No método main, criamos uma instância da classe Carro e chamamos os métodos e propriedades da instância. 
// A saída do código mostra a cor do carro, liga o carro, verifica se o carro está ligado e retorna o tamanho do carro.
// As propriedades e métodos da classe Carro são acessíveis e utilizáveis no escopo do arquivo.
// As variáveis privadas e métodos privados são acessíveis apenas dentro da classe Carro.

