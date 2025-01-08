class Costs {
  String id;
  String data;
  double preco;
  String? descricaoDaDespesa;
  String tipoDespesa;

  Costs({
    required this.id,
    required this.data,
    required this.preco,
    required this.descricaoDaDespesa,
    required this.tipoDespesa,
  });

  Costs.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        data = map['data'],
        preco = map['preco'].toDouble(),
        descricaoDaDespesa = map['descricao'],
        tipoDespesa = map['tipoDespesa'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'data': data,
      'preco': preco,
      'descricaoDaDespesa': descricaoDaDespesa,
      'tipoDespesa': tipoDespesa,
    };
  }
}
