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
    this.descricaoDaDespesa,
    required this.tipoDespesa,
  });

  Costs.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        data = map['data'],
        preco = map['minutos'],
        descricaoDaDespesa = map['descricao'],
        tipoDespesa = map['nome'];

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
