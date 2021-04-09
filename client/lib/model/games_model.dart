import 'package:flutter/material.dart';

//1 Criando a model
class GamesModel {
  int id;
  final String nome;
  final String genero;
  final String descricao;

  GamesModel({this.id, this.nome, this.genero, this.descricao});

// Criando um map para json
  factory GamesModel.fromjson(Map<String, dynamic> json) {
    return GamesModel(
        id: json['id'],
        nome: json['nome'],
        genero: json['genero'],
        descricao: json['descricao']);
  }
//Valores json
  dynamic toJson() =>
      {'id': id, 'nome': nome, 'genero': genero, 'descricao': descricao};
}
