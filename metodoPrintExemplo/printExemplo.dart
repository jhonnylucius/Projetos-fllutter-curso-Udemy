/*void main() {
  String name = 'John Doe';
  name = 'joão'; // alterando o valor da variável
  int idade = 10;
  idade = 44; // alterando o valor da variável
  // print(name + ' tem ' + idade.toString() + ' anos'); // contatenando strings
  print('$name tem $idade anos'); // interpolação de strings
}
*/

/* void main() {
  String nome = 'John Doe';
  int idade = 44;
  double altura = 1.80;
  bool maiorDeIdade = idade >= 18;
  print('Nome: $nome');
  print('Idade: $idade');
  print('Altura: $altura');
  print('Maior de idade: $maiorDeIdade');
}*/

// OBS: O tipo de uma variável é inferido pelo valor atribuído a ela.
// OBS: O tipo de uma variável pode ser explícito.
// OBS: O tipo de uma variável pode ser dinâmico.
// OBS: O tipo de uma variável pode ser definido como final.
// OBS: O tipo de uma variável pode ser definido como const.
// OBS: O tipo de uma variável pode ser definido como var.
// OBS: O tipo de uma variável pode ser definido como Object.
// variaveis usamos para armazenar valores que podem ser alterados
// constantes usamos para armazenar valores que não podem ser alterados
// final usamos para armazenar valores que não podem ser alterados
// var usamos para armazenar valores que não sabemos o tipo
// Object usamos para armazenar valores que não sabemos o tipo
// dynamic variavel = 'valor'; // variável dinâmica que pode receber qualquer tipo de valor em tempo de execução
// final constante = 'valor'; // constante que não pode ser alterada
// final var variavelExterna = 'valor'; // variável externa que pode ser alterada

// OBS: O tipo de uma variável é inferido pelo valor atribuído a ela.
// coloque nomes de varaveis sugestivos de acordo com o que ela armazena

/*void main() {
  int idade = 10;
  print(idade);
  idade = idade + 5; // aqui seria o mesmo que idade += 5;
  print(idade);
  idade += 5; // aqui seria o mesmo que idade = idade + 5;
  print(idade);
  String nome = 'John Doe';
  String nomeCompleto = nome + ' Silva'; // concatenando strings
  String nomeCompleto2 = '$nome Silva'; // interpolação de strings
  String nomeCompleto3 = '${nomeCompleto2 + ' está feliz'}'; // interpolação de strings
  print(nomeCompleto);
  print(nomeCompleto2);
  print(nomeCompleto3);
}*/
//Observações sobre os exemplos de concatenação de strings e como incrementar valores de variáveis acima.
// OBS: O operador de concatenação de strings é o sinal de adição (+).
// OBS: O operador de incremento é o sinal de adição seguido do sinal de igual (+=).
// OBS: O operador de decremento é o sinal de subtração seguido do sinal de igual (-=).
// OBS: O operador de multiplicação é o sinal de multiplicação seguido do sinal de igual (*=).
// OBS: O operador de divisão é o sinal de divisão seguido do sinal de igual (/=).
// OBS: O operador de resto é o sinal de porcentagem seguido do sinal de igual (%=).
// OBS: O operador de incremento e decremento só podem ser usados com variáveis numéricas.
// OBS: O operador de multiplicação, divisão e resto só podem ser usados com variáveis numéricas.
// OBS: O operador de incremento e decremento só podem ser usados com variáveis numéricas.

// abaixo tipos de variaveis final e const  e var

/*void main() {
  final int idadeFinal = 10;
  // idadeFinal = 15; // erro: constant expression cannot be assigned to final variable 'idadeFinal'

  const String nomeConstante = 'John Doe';
  // nomeConstante = 'Jane Doe'; // erro: constant expression cannot be assigned to final variable 'nomeConstante'

  var nomeVariavel = 'John Doe';
  // nomeVariavel = 10; // erro: variable 'nomeVariavel' of type 'String' can't be assigned with a value of type 'int'
  print(nomeVariavel); 
  nomeVariavel = 'Jane Doe'; // alterando o valor da variável
  print(nomeVariavel);
  nomeVariavel = 10.toString(); // convertendo um valor numérico para string
  print(nomeVariavel);
  nomeVariavel = 10.0.toString(); // convertendo um valor numérico para string
  print(nomeVariavel);
  nomeVariavel = true.toString(); // convertendo um valor booleano para string
  print(nomeVariavel);
  nomeVariavel = false.toString(); // convertendo um valor booleano para string
  print(nomeVariavel);
  nomeVariavel = (!false).toString(); // convertendo um valor booleano para string
  print(nomeVariavel);
  nomeVariavel = [1, 2, 3].toString(); // convertendo uma lista para string
  print(nomeVariavel);
  nomeVariavel = {'nome': 'John Doe'}.toString(); // convertendo um mapa para string
  print(nomeVariavel);
  nomeVariavel = {'nome': 'John Doe', 'idade': 44}.toString(); // convertendo um mapa para string
  print(nomeVariavel);
  nomeVariavel = {'nome': 'John Doe', 'idade': 44, 'altura': 1.80}.toString(); // convertendo um mapa para string
  print(nomeVariavel);
  nomeVariavel = { 
    'nome': 'John Doe',
    'idade': 44,
    'altura': 1.80,
    'maiorDeIdade': true
  }.toString();
} // convertendo um mapa para string
// OBS: O tipo de uma variável é inferido pelo valor atribuído a ela.
*/

void main() {
  final canal2 = DateTime
      .now(); // variável final datetime inicializada com a data e hora atual
  const apiKey =
      'iadhjilotj943t5ueaqwouftj'; // variável constante tem de ser conhecida com  certeza de que não vai mudar
  var nome =
      'John Doe'; // variável var pode ser de qualquer tipo  e pode ser alterada a qualquer momento
  print(canal2);
  print(apiKey);
  print(nome);
}
