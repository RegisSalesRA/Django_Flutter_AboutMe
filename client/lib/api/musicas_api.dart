import 'package:client/model/musicas_model.dart';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MusicasProvider with ChangeNotifier {
  MusicasProvider() {
    this.fetchTasks();
  }

  // ignore: non_constant_identifier_names
  List<MusicasModel> _my_musica = [];

  // ignore: non_constant_identifier_names
  List<MusicasModel> get my_musica {
    return [..._my_musica];
  }

//Adicionar
  // ignore: non_constant_identifier_names
  void addMusicas(MusicasModel my_musica) async {
    final response = await http.post('http://10.0.2.2:8000/api/v1/musicas/',
        headers: {"Content-Type": "application/json"},
        body: json.encode(my_musica));

    if (response.statusCode == 201) {
      my_musica.id = json.decode(response.body)['id'];
      _my_musica.add(my_musica);
      notifyListeners();
    }
  }

//Deletar
  // ignore: non_constant_identifier_names
  void deleteViagens(MusicasModel my_musica) async {
    final response = await http
        .delete('http://10.0.2.2:8000/api/v1/musicas/${my_musica.id}/');
    if (response.statusCode == 204) {
      _my_musica.remove(my_musica);
      notifyListeners();
    }
  }

//Listar
  fetchTasks() async {
    final url = 'http://10.0.2.2:8000/api/v1/musicas/?format=json';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _my_musica = data
          .map<MusicasModel>((json) => MusicasModel.fromjson(json))
          .toList();
      notifyListeners();
    }
  }
}
