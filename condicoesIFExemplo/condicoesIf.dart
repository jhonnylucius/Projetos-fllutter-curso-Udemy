bool isVip = true;
int age = 65;
String name = "Dart";

/*void main() {
  //if
  isVip = !isVip; // negando o valor da variável
  // condição 1: é um vip?
  if (name == 'Dart' && isVip == true || age >= 18 && age <= 64) {
    // podemos colocar quantas condições quisermos
    // if é uma afirmação que verifica se a condição é verdadeira
    print('entrada permitida');
  } else if (age >= 65) {
    // if a condição    anterior for falsa, ele verifica a próxima condição
    print('entrada permitida à sala VIP');
  } else {
    print('entrada proibida');
  }
}
// OBS: O operador de igualdade é o sinal de igualdade (==).
// OBS: O operador de diferente é o sinal de exclamação seguido do sinal de igualdade (!=).
// OBS: O operador de maior é o sinal de maior que (>).
// OBS: O operador de menor é o sinal de menor que (<).
// OBS: O operador de maior ou igual é o sinal de maior que seguido do sinal de igual (>=).
// OBS: O operador de menor ou igual é o sinal de menor que seguido do sinal de igual (<=).
// OBS: O operador de e é o sinal de e comercial (&&).
// OBS: O operador de ou é o sinal de barra vertical (||).
// OBS: O operador de negação é o sinal de exclamação (!).
// OBS: O operador de incremento é o sinal de adição seguido do sinal de igual (+=).
// OBS: O operador de decremento é o sinal de subtração seguido do sinal de igual (-=).
// OBS: O operador de multiplicação é o sinal de multiplicação seguido do sinal de igual (*=).
// OBS: O operador de divisão é o sinal de divisão seguido do sinal de igual (/=).
// OBS: O operador de resto é o sinal de porcentagem seguido do sinal de igual (%=).
// OBS: O operador de incremento e decremento só podem ser usados com variáveis numéricas.
*/
void main() {
  //if
  isVip = !isVip; // negando o valor da variável
  // condição 1: é um vip?
  if (name == 'Dart' && isVip == true || age >= 18 && age <= 64) {
    // podemos colocar quantas condições quisermos
    // if é uma afirmação que verifica se a condição é verdadeira
    print('entrada permitida');
  } else if (age >= 65) {
    // if a condição    anterior for falsa, ele verifica a próxima condição
    print('entrada permitida à sala VIP');
  } else {
    print('entrada proibida');
  }
}
