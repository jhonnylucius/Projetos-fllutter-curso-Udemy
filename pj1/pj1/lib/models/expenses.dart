class Expenses {
  String id;
  String data;
  double preco;
  String? descricaoDaReceita;
  String tipoReceita;

  Expenses({
    required this.id,
    required this.data,
    required this.preco,
    required this.descricaoDaReceita,
    required this.tipoReceita,
  });

  Expenses.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        data = map['data'],
        preco = map['preco'].toDouble(),
        descricaoDaReceita = map['descricao'],
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
