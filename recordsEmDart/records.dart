// Exemplo básico de um record em Dart
void basicRecordExample() {
  // Criando um record com dois campos
  var record = (1, 'Hello');

  // Acessando campos por posição
  print(record.$1); // Saída: 1
  print(record.$2); // Saída: Hello
}

// Exemplo avançado de um record em Dart
void advancedRecordExample() {
  // Criando um record com campos nomeados
  var namedRecord = (id: 1, message: 'Hello', isActive: true);

  // Acessando campos por nome
  print(namedRecord.id); // Saída: 1
  print(namedRecord.message); // Saída: Hello
  print(namedRecord.isActive); // Saída: true

  // Criando um record com campos posicionais e nomeados
  var mixedRecord = (1, 'Hello', isActive: true);

  // Acessando campos posicionais
  print(mixedRecord.$1); // Saída: 1
  print(mixedRecord.$2); // Saída: Hello

  // Acessando campo nomeado
  print(mixedRecord.isActive); // Saída: true

  // Desestruturando um record
  var (id, message, isActive: isActive) = mixedRecord;
  print(id); // Saída: 1
  print(message); // Saída: Hello
  print(isActive); // Saída: true
}

void main() {
  basicRecordExample();
  advancedRecordExample();
}

// Explicações
// 1. Um record é uma estrutura de dados imutável que contém campos nomeados ou posicionais.
// 2. Os campos de um record podem ser acessados por posição ou nome.
// 3. Um record pode conter campos posicionais e nomeados.
// 4. É possível desestruturar um record para acessar seus campos.
// 5. Os records são imutáveis, o que significa que seus campos não podem ser alterados após a criação.
// 6. Os records são úteis para representar dados imutáveis e garantir a integridade dos dados.
// 7. Os records são uma adição recente ao Dart e são uma alternativa aos objetos e classes tradicionais.
// 8. Os records são uma forma concisa e expressiva de definir estruturas de dados em Dart.

// Referências
// https://dart.dev/guides/language/language-tour#records
// https://dart.dev/guides/language/language-tour#constructors
