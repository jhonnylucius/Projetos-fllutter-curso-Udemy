void main() {
  final gol = Carro(cor: 'azul', tamanho: 3.80); // Instanciando a classe Carro

  print(gol.cor); // Carro Branco
  gol.ligar(); // chamando o metodo ligar
  print(gol.estaLigado()); // true
  print(gol.retornaTamanho()); // 8
}

class Carro {
  // variaveis = propriedades
  // funções = metodos
  final String cor;
  final double tamanho;

  final int _altura = 4; // variavel privada
  int _largura = 2; // variavel privada

  Carro(
      {required this.cor,
      required this.tamanho}); // chamando o metodo construtor

  int retornaTamanho() {
    return _altura *
        _largura; // chamando o metodo privado que é acessivel dentro do arquivo, mesmo
    // sendo privado, mas são realmente privados quando tentados acessar fora do arquivo.
  } // metodo privado

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
//e métodos ligar, estaLigado e retornaTamanho.
// A propriedade cor é uma variável final, o que significa que seu valor é definido
// no construtor e não pode ser alterado posteriormente.
// A propriedade tamanho é uma variável final também, que é definida no construtor.
// A variável _altura é privada e só pode ser acessada dentro da classe Carro.
// A variável _largura é privada e pode ser acessada dentro do arquivo.
// O método retornaTamanho é privado e só pode ser acessado dentro da classe Carro.
// O método ligar imprime uma mensagem indicando que o carro foi ligado.
// O método estaLigado retorna true, indicando que o carro está ligado.
// No método main, criamos uma instância da classe Carro e chamamos os métodos e propriedades da instância.
// A saída do código mostra a cor do carro, liga o carro, verifica se o carro está ligado e retorna o tamanho do carro.
// As propriedades e métodos da classe Carro são acessíveis e utilizáveis no escopo do arquivo.
// As variáveis privadas e métodos privados são acessíveis apenas dentro da classe Carro.
