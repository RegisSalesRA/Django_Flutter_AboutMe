//1 Criando a model
class FaculdadeModel {
  int id;
  final String nome;
  final String curso;

  FaculdadeModel({this.id, this.nome, this.curso});

// Criando um map para json
  factory FaculdadeModel.fromjson(Map<String, dynamic> json) {
    return FaculdadeModel(
        id: json['id'], nome: json['nome'], curso: json['curso']);
  }
//Valores json
  dynamic toJson() => {'id': id, 'nome': nome, 'curso': curso};
}
