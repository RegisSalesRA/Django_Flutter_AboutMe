import 'package:client/api/faculdade_api.dart';

import 'package:client/model/faculdade_model.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AddFaculdade extends StatefulWidget {
  @override
  _AddFaculdadeState createState() => _AddFaculdadeState();
}

class _AddFaculdadeState extends State<AddFaculdade> {
  final myDescNomeController = TextEditingController();
  final myDescCursoController = TextEditingController();

  void onAdd() {
    final String nomeVal = myDescNomeController.text;
    final String cursoVal = myDescCursoController.text;

    if (nomeVal.isNotEmpty && cursoVal.isNotEmpty) {
      final FaculdadeModel myFaculdade =
          FaculdadeModel(nome: nomeVal, curso: cursoVal);
      Provider.of<FaculdadeProvider>(context, listen: false)
          .addTrabalho(myFaculdade);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Adicione um faculdade"),
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
                  color: Colors.blue,
                ),
                TextField(
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                  controller: myDescNomeController,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.blue),
                      labelText: "Digite nome"),
                ),
                TextField(
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                  controller: myDescCursoController,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.blue),
                      labelText: "Digite curso"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: RaisedButton(
                      color: Colors.blue,
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
