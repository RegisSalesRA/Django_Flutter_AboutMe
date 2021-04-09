import 'package:flutter/material.dart';

//1 Criando a model
class MusicasModel {
  int id;
  final String nome;
  final String album;
  final String descricao;

  MusicasModel({this.id, this.nome, this.album, this.descricao});

// Criando um map para json
  factory MusicasModel.fromjson(Map<String, dynamic> json) {
    return MusicasModel(
        id: json['id'],
        nome: json['nome'],
        album: json['album'],
        descricao: json['descricao']);
  }
//Valores json
  dynamic toJson() =>
      {'id': id, 'nome': nome, 'album': album, 'descricao': descricao};
}
