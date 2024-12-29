void main() {
// Future(promisses JS) é um objeto que representa um valor que pode estar disponível agora, no futuro ou nunca.
  Future myFuture = Future(() {
    print('Criando função do futuro'); // Criando função do futuro
    return 15;
  })
      .catchError((error) => print('Erro: $error')) // Tratamento de erro
      .then(
          (val) => print('O valor do futuro é $val')); // Tratamento de sucesso

  minhaFuncao().then((val) =>
      print('O valor do futuro é $val')); // Chamando a função minhaFuncao

  print(
      'Executando o código antes do futuro'); // Executado o código antes do futuro
}

Future minhaFuncao() async {
  //  Executando o código antes do futuro
  print("Estou dentro da função");
  await Future.delayed(Duration(seconds: 2)); // Aguarda 2 segundos
  return 5;
}

// Explicações
// 1. O Future é um objeto que representa um valor que pode estar disponível agora, no futuro ou nunca.
// 2. O Future é uma promessa de que um valor será retornado.
