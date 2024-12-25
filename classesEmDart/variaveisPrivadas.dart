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
    return _altura * _largura;
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
