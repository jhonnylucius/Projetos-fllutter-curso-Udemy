void main() {
  final gol = Carro(cor: 'azul', tamanho: 3.80); // Instanciando a classe Carro

  print(gol.cor); // Carro Branco
  gol.ligar(); // chamando o metodo ligar
  print(gol.estaLigado()); // true
  print(gol.retornaTamanho()); // 8
  print(gol.altura); // 5
  gol.setAltura = 6; // chamando o metodo setAltura
}

class Carro {
  // variaveis = propriedades
  // funções = metodos
  final String cor;
  final double tamanho;

  int _altura = 5; // variavel privada
  final int _largura = 2; // variavel privada

  int get altura =>
      _altura; // metodo get altura informando que é privado de leitura

  set setAltura(int altura) {
    // metodo set altura informando que é privado de escrita
    if (altura >= 5) {
      _altura = altura;
    } else {
      print('Altura inválida');
    }
  }

  void modifigaAltura(int altura) {
    // metodo modificaAltura
    // regras seria colocadas aqui
    _altura = altura; // atribuindo o valor da variavel privada
  }

  Carro(
      {required this.cor,
      required this.tamanho}); // chamando o metodo construtor

  int retornaTamanho() {
    return _altura * // metodo privado
        _largura; // chamando o metodo privado que é acessivel dentro do arquivo, mesmo
    // sendo privado, mas são realmente privados quando tentados acessar fora do arquivo.
  }

  void ligar() {
    // metodo ligar com o metodo print
    print('Carro ligado');
  }

  bool estaLigado() {
    // metodo estaLigado com o metodo print
    return true;
  }
}
