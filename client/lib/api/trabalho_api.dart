import 'dart:ui';

import 'package:client/model/trabalho_model.dart';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TrabalhoProvider with ChangeNotifier {
  TrabalhoProvider() {
    this.fetchTasks();
  }

  List<TrabalhoModel> _my_trabalho = [];

  List<TrabalhoModel> get my_trabalho {
    return [..._my_trabalho];
  }

  void addTrabalho(TrabalhoModel my_trabalho) async {
    final response = await http.post('http://10.0.2.2:8000/api/v1/trabalhos/',
        headers: {"Content-Type": "application/json"},
        body: json.encode(my_trabalho));

    if (response.statusCode == 201) {
      my_trabalho.id = json.decode(response.body)['id'];
      _my_trabalho.add(my_trabalho);
      notifyListeners();
    }
  }

  void deleteViagens(TrabalhoModel my_trabalho) async {
    final response = await http
        .delete('http://10.0.2.2:8000/api/v1/trabalhos/${my_trabalho.id}/');
    if (response.statusCode == 204) {
      _my_trabalho.remove(my_trabalho);
      notifyListeners();
    }
  }

  fetchTasks() async {
    final url = 'http://10.0.2.2:8000/api/v1/trabalhos/?format=json';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _my_trabalho = data
          .map<TrabalhoModel>((json) => TrabalhoModel.fromjson(json))
          .toList();
      notifyListeners();
    }
  }
}
