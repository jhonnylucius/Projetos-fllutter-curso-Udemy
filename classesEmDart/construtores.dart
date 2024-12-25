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
