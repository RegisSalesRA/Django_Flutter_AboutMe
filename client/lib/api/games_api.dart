import 'dart:ui';

import 'package:client/model/games_model.dart';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GamesProvider with ChangeNotifier {
  GamesProvider() {
    this.fetchTasks();
  }

  List<GamesModel> _my_games = [];

  List<GamesModel> get my_games {
    return [..._my_games];
  }

//Adicionar
  void addGames(GamesModel my_games) async {
    final response = await http.post('http://10.0.2.2:8000/api/v1/games/',
        headers: {"Content-Type": "application/json"},
        body: json.encode(my_games));

    if (response.statusCode == 201) {
      my_games.id = json.decode(response.body)['id'];
      _my_games.add(my_games);
      notifyListeners();
    }
  }

//Deletar
  void deleteGames(GamesModel my_games) async {
    final response =
        await http.delete('http://10.0.2.2:8000/api/v1/gamess/${my_games.id}/');
    if (response.statusCode == 204) {
      _my_games.remove(my_games);
      notifyListeners();
    }
  }

//Listar
  fetchTasks() async {
    final url = 'http://10.0.2.2:8000/api/v1/games/?format=json';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _my_games =
          data.map<GamesModel>((json) => GamesModel.fromjson(json)).toList();
      notifyListeners();
    }
  }
}
