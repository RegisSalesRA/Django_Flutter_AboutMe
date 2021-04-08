import 'package:flutter/material.dart';

class MyDescription {
  int id;
  final String nome;
  final String idade;
  final String descricao;

  MyDescription({this.id, this.nome, this.idade, this.descricao});

  factory MyDescription.fromjson(Map<String, dynamic> json) {
    return MyDescription(
        id: json['id'],
        nome: json['nome'],
        idade: json['idade'],
        descricao: json['descricao']);
  }
  dynamic toJson() =>
      {'id': id, 'nome': nome, 'idade': idade, 'descricao': descricao};
}
