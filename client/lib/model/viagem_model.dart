import 'package:flutter/material.dart';

class ViagemModel {
  int id;
  final String nome;
  final String local;
  final String descricao;

  ViagemModel({this.id, this.nome, this.local, this.descricao});

  factory ViagemModel.fromjson(Map<String, dynamic> json) {
    return ViagemModel(
        id: json['id'],
        nome: json['nome'],
        local: json['local'],
        descricao: json['descricao']);
  }
  dynamic toJson() =>
      {'id': id, 'nome': nome, 'local': local, 'descricao': descricao};
}
