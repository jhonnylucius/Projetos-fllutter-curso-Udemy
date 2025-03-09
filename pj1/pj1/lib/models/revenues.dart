class Revenues {
  String id;
  String data;
  double preco;
  String? descricaoDaReceita;
  String tipoReceita;

  Revenues({
    required this.id,
    required this.data,
    required this.preco,
    required this.descricaoDaReceita,
    required this.tipoReceita,
  });

  Revenues.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        data = map['data'],
        preco = map['preco'].toDouble(),
        descricaoDaReceita = map['descricaoDaReceita'],
        tipoReceita = map['tipoReceita'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'data': data,
      'preco': preco,
      'descricaoDaReceita': descricaoDaReceita,
      'tipoReceita': tipoReceita,
    };
  }
}
