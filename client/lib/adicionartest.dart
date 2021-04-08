import 'package:client/api/testeapi.dart';
import 'package:client/testando.dart';
import 'package:flutter/material.dart';
//import 'package:frontend_flutter/api/api.dart';

import 'package:provider/provider.dart';

class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final myDescNomeController = TextEditingController();
  final myDescIdadeController = TextEditingController();
  final myDescDescricaoController = TextEditingController();

  void onAdd() {
    final String nomeVal = myDescNomeController.text;
    final String idadeVal = myDescIdadeController.text;
    final String descricaoVal = myDescDescricaoController.text;

    if (nomeVal.isNotEmpty && descricaoVal.isNotEmpty && idadeVal.isNotEmpty) {
      final MyDescription myDesc = MyDescription(
          nome: nomeVal, descricao: descricaoVal, idade: idadeVal);
      Provider.of<MyDescriptionProvider>(context, listen: false)
          .addToDo(myDesc);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Adicione uma tarefa"),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Icon(
                  Icons.featured_play_list_outlined,
                  size: 110.0,
                  color: Colors.red,
                ),
                TextField(
                  style: TextStyle(color: Colors.red, fontSize: 20),
                  controller: myDescNomeController,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.red),
                      labelText: "Digite nome"),
                ),
                TextField(
                  style: TextStyle(color: Colors.red, fontSize: 20),
                  controller: myDescIdadeController,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.red),
                      labelText: "Digite idade"),
                ),
                TextField(
                  style: TextStyle(color: Colors.red, fontSize: 20),
                  controller: myDescDescricaoController,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.red),
                      labelText: "Digite descricao"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: RaisedButton(
                      color: Colors.red,
                      child: Text("Confirmar",
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        onAdd();
                        Navigator.of(context).pop();
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
