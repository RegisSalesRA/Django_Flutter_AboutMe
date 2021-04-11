import 'package:client/model/filmes_model.dart';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FilmesProvider with ChangeNotifier {
  FilmesProvider() {
    this.fetchTasks();
  }

  // ignore: non_constant_identifier_names
  List<FilmesModel> _my_filme = [];

  // ignore: non_constant_identifier_names
  List<FilmesModel> get my_filme {
    return [..._my_filme];
  }

  // ignore: non_constant_identifier_names
  void addFilmes(FilmesModel my_filme) async {
    final response = await http.post('http://10.0.2.2:8000/api/v1/filmes/',
        headers: {"Content-Type": "application/json"},
        body: json.encode(my_filme));
    print(response);
    if (response.statusCode == 201) {
      my_filme.id = json.decode(response.body)['id'];
      _my_filme.add(my_filme);
      notifyListeners();
    }
  }

  // ignore: non_constant_identifier_names
  void deleteFilmes(FilmesModel my_filme) async {
    final response =
        await http.delete('http://10.0.2.2:8000/api/v1/filmes/${my_filme.id}/');
    if (response.statusCode == 204) {
      _my_filme.remove(my_filme);
      notifyListeners();
    }
  }

  fetchTasks() async {
    final url = 'http://10.0.2.2:8000/api/v1/filmes/?format=json';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _my_filme =
          data.map<FilmesModel>((json) => FilmesModel.fromjson(json)).toList();
      notifyListeners();
    }
  }
}
