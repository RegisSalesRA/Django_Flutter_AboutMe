//1 Criando a model
class FilmesModel {
  int id;
  final String nome;
  final String categoria;
  final String descricao;

  FilmesModel({this.id, this.nome, this.categoria, this.descricao});

// Criando um map para json
  factory FilmesModel.fromjson(Map<String, dynamic> json) {
    return FilmesModel(
        id: json['id'],
        nome: json['nome'],
        categoria: json['categoria'],
        descricao: json['descricao']);
  }
//Valores json
  dynamic toJson() =>
      {'id': id, 'nome': nome, 'categoria': categoria, 'descricao': descricao};
}
