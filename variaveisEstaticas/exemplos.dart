void main() {
  // Função principal
  final constantes = Contantes(); // Instanciando a classe Contantes
  print(constantes.apiKey); // Imprimindo a constante apiKey
  print(constantes.database); // Imprimindo a constante database
  print(constantes.host); // Imprimindo a constante host
  print(Contantes.getPrecoQualquer()); // Imprimindo o método getPrecoQualquer
  Contantes.digaOla(); // Chamando o método digaOla()
}

class Contantes {
  // Classe
  String apiKey = "93523523rt3t2353rf32r"; // Constantes
  String database = "loja"; // Constantes
  String host = "localhost"; // Constantes

  Contantes() {
    // Constructor
    print('objeto criado');
  } // Private constructor to prevent instantiation

  static double getPrecoQualquer() {
    return 15.4;
  }

  static digaOla() {
    print('Olá');
  }
}
// Executando o código
/*main();
 // Output: criei objeto
 // 93523523rt3t2353rf32r
 // loja
 // localhost
 // 15.4

// A saída do código acima mostra que o construtor da classe Contantes foi chamado, 
//indicando que o objeto foi criado. As constantes apiKey, database, e host são impressas na tela, 
//demonstrando a disponibilidade dessas variáveis em todo o código.
// A criação de um novo objeto da classe Contantes é feita através da chamada do método main()*/
