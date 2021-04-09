import 'package:client/api/games_api.dart';

import 'package:client/model/games_model.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AddGames extends StatefulWidget {
  @override
  _AddGamesState createState() => _AddGamesState();
}

class _AddGamesState extends State<AddGames> {
  final myDescNomeController = TextEditingController();
  final myDescGeneroController = TextEditingController();
  final myDescDescricaoController = TextEditingController();

  void onAdd() {
    final String nomeVal = myDescNomeController.text;
    final String generoVal = myDescGeneroController.text;
    final String descricaoVal = myDescDescricaoController.text;

    if (nomeVal.isNotEmpty && descricaoVal.isNotEmpty && generoVal.isNotEmpty) {
      final GamesModel myGames =
          GamesModel(nome: nomeVal, descricao: descricaoVal, genero: generoVal);
      Provider.of<GamesProvider>(context, listen: false).addGames(myGames);
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
                  controller: myDescGeneroController,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.blue),
                      labelText: "Digite Genero"),
                ),
                TextField(
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                  controller: myDescDescricaoController,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.blue),
                      labelText: "Digite descricao"),
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
