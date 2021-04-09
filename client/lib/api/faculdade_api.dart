import 'dart:ui';

import 'package:client/model/faculdade_model.dart';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FaculdadeProvider with ChangeNotifier {
  FaculdadeProvider() {
    this.fetchTasks();
  }

  List<FaculdadeModel> _my_faculdade = [];

  List<FaculdadeModel> get my_faculdade {
    return [..._my_faculdade];
  }

  void addFaculdade(FaculdadeModel my_faculdade) async {
    final response = await http.post('http://10.0.2.2:8000/api/v1/faculdades/',
        headers: {"Content-Type": "application/json"},
        body: json.encode(my_faculdade));

    if (response.statusCode == 201) {
      my_faculdade.id = json.decode(response.body)['id'];
      _my_faculdade.add(my_faculdade);
      notifyListeners();
    }
  }

  void deleteFaculdade(FaculdadeModel my_faculdade) async {
    final response = await http
        .delete('http://10.0.2.2:8000/api/v1/faculdades/${my_faculdade.id}/');
    if (response.statusCode == 204) {
      _my_faculdade.remove(my_faculdade);
      notifyListeners();
    }
  }

  fetchTasks() async {
    final url = 'http://10.0.2.2:8000/api/v1/faculdades/?format=json';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _my_faculdade = data
          .map<FaculdadeModel>((json) => FaculdadeModel.fromjson(json))
          .toList();
      notifyListeners();
    }
  }
}
