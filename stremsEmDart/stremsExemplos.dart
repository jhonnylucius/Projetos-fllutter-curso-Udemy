import 'dart:async';

void main() async {
  // Adicionado async
  // 1. Criando um StreamController
  final controller = StreamController<int>.broadcast();

  // 2. Obtendo o Stream
  final stream = controller.stream;

  // 3. Escutando o Stream antes de adicionar valores
  stream.listen(
    (value) => print('Valor recebido: $value'),
    onDone: () => print('Stream finalizado'),
  );

  // 4. Adicionando eventos ao Stream
  controller.add(1);
  controller.add(2);
  controller.add(3);

  // 5. Calculando a soma (forma assíncrona)
  final sum = await stream.fold(0, (acc, value) => acc + value);
  print("Soma dos valores: $sum");

  // 6. Fechando o Stream
  await controller.close();
}

// Explicações
// 1. Stream
// - Um Stream é uma sequência de eventos assíncronos.
// - Ele pode emitir valores, erros e notificações de conclusão.
// 2. StreamController
// - Um StreamController é usado para criar e controlar um Stream.
// - Ele permite adicionar eventos ao Stream e fechar o Stream quando necessário.
// 3. Escutando o Stream
// - O método listen() é usado para escutar os eventos emitidos pelo Stream.
// - O parâmetro onDone é chamado quando o Stream é fechado.
// 4. Adicionando eventos
// - O método add() é usado para adicionar eventos ao Stream.
// 5. Calculando a soma
// - O método fold() é usado para calcular a soma dos valores emitidos pelo Stream.
// - O await é usado para esperar a conclusão da operação assíncrona.
// 6. Fechando o Stream
// - O método close() é usado para fechar o Stream e liberar os recursos associados.
