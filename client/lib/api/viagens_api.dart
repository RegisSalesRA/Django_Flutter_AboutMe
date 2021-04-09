import 'dart:ui';

import 'package:client/model/viagem_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ViagensProvider with ChangeNotifier {
  ViagensProvider() {
    this.fetchTasks();
  }

  List<ViagemModel> _my_viagem = [];

  List<ViagemModel> get my_viagem {
    return [..._my_viagem];
  }

  void addViagens(ViagemModel my_viagem) async {
    final response = await http.post('http://10.0.2.2:8000/api/v1/viagens/',
        headers: {"Content-Type": "application/json"},
        body: json.encode(my_viagem));
    print(response);
    if (response.statusCode == 201) {
      my_viagem.id = json.decode(response.body)['id'];
      _my_viagem.add(my_viagem);
      notifyListeners();
    }
  }

  void deleteViagens(ViagemModel my_viagem) async {
    final response = await http
        .delete('http://10.0.2.2:8000/api/v1/viagens/${my_viagem.id}/');
    if (response.statusCode == 204) {
      _my_viagem.remove(my_viagem);
      notifyListeners();
    }
  }

  fetchTasks() async {
    final url = 'http://10.0.2.2:8000/api/v1/viagens/?format=json';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _my_viagem =
          data.map<ViagemModel>((json) => ViagemModel.fromjson(json)).toList();
      notifyListeners();
    }
  }
}
