class Hour {
  String id;
  String data;
  int minutos;
  String? descricao;
  String nome;
  double preco;

  Hour({
    required this.id,
    required this.data,
    required this.minutos,
    required this.descricao,
    required this.nome,
    required this.preco,
  });

  Hour.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        data = map['data'],
        minutos = map['minutos'],
        descricao = map['descricao'],
        nome = map['nome'],
        preco = map['preco'].toDouble();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'data': data,
      'minutos': minutos,
      'descricao': descricao,
      'nome': nome,
      'preco': preco,
    };
  }
}
