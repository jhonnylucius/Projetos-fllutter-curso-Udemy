void main() {
  final gol = Carro(cor: 'azul', tamanho: 3.80); // Instanciando a classe Carro

  print(gol.cor); // Carro Branco
  gol.ligar(); // chamando o metodo ligar
  print(gol.estaLigado()); // true
  print(gol.retornaTamanho()); // 8

  print(gol.altura);
  gol.modificaAltura(15);
  print(gol.altura);
}

class Carro {
  // variaveis = propriedades
  // funções = metodos
  final String cor;
  final double tamanho;

  int _altura = 4; // variavel privada
  final int _largura = 2; // variavel privada

  int get altura => _altura; // getter para acessar a variavel privada

  Carro(
      {required this.cor,
      required this.tamanho}); // chamando o metodo construtor

  int retornaTamanho() {
    // metodo privado
    return _altura *
        _largura; // chamando o metodo privado que é acessivel dentro do arquivo, mesmo
    // sendo privado, mas são realmente privados quando tentados acessá-los fora do arquivo.
  }

  void ligar() {
    // metodo ligar
    print('Carro ligado');
  }

  bool estaLigado() {
    // metodo estaLigado booleano
    return true;
  }

  void modificaAltura(int novaAltura) {
    // setter para modificar a variavel privada
    _altura = novaAltura;
  }
}
