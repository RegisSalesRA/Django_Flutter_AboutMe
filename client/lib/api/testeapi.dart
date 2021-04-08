import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../testando.dart';

class MyDescriptionProvider with ChangeNotifier {
  MyDescriptionProvider() {
    this.fetchTasks();
  }

  List<MyDescription> _my_description = [];

  List<MyDescription> get my_description {
    return [..._my_description];
  }

  void addToDo(MyDescription my_description) async {
    final response = await http.post(
        'http://10.0.2.2:8000/api/v1/my_description/',
        headers: {"Content-Type": "application/json"},
        body: json.encode(my_description));
    print(response);
    if (response.statusCode == 201) {
      my_description.id = json.decode(response.body)['id'];
      _my_description.add(my_description);
      notifyListeners();
    }
  }

  void deleteToDo(MyDescription my_description) async {
    final response = await http.delete(
        'http://10.0.2.2:8000/api/v1/my_description/${my_description.id}/');
    if (response.statusCode == 204) {
      _my_description.remove(my_description);
      notifyListeners();
    }
  }

  fetchTasks() async {
    final url = 'http://10.0.2.2:8000/api/v1/my_description/?format=json';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _my_description = data
          .map<MyDescription>((json) => MyDescription.fromjson(json))
          .toList();
      notifyListeners();
    }
  }
}
