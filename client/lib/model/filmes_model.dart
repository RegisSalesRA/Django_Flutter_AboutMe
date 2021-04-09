import 'package:flutter/material.dart';

class FilmesModel {
  int id;
  final String nome;
  final String categoria;
  final String descricao;

  FilmesModel({this.id, this.nome, this.categoria, this.descricao});

  factory FilmesModel.fromjson(Map<String, dynamic> json) {
    return FilmesModel(
        id: json['id'],
        nome: json['nome'],
        categoria: json['categoria'],
        descricao: json['descricao']);
  }
  dynamic toJson() =>
      {'id': id, 'nome': nome, 'categoria': categoria, 'descricao': descricao};
}
