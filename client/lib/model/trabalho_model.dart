//1 Criando a model
class TrabalhoModel {
  int id;
  final String nome;
  final String descricao;

  TrabalhoModel({this.id, this.nome, this.descricao});

// Criando um map para json
  factory TrabalhoModel.fromjson(Map<String, dynamic> json) {
    return TrabalhoModel(
        id: json['id'], nome: json['nome'], descricao: json['descricao']);
  }
//Valores json
  dynamic toJson() => {'id': id, 'nome': nome, 'descricao': descricao};
}
