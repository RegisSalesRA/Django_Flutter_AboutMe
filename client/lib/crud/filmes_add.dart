import 'package:client/api/filmes_api.dart';
import 'package:client/api/viagens_api.dart';
import 'package:client/model/filmes_model.dart';
import 'package:client/model/viagem_model.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AddFilme extends StatefulWidget {
  @override
  _AddFilmeState createState() => _AddFilmeState();
}

class _AddFilmeState extends State<AddFilme> {
  final myDescNomeController = TextEditingController();
  final myDesccategoriaController = TextEditingController();
  final myDescDescricaoController = TextEditingController();

  void onAdd() {
    final String nomeVal = myDescNomeController.text;
    final String idadeVal = myDesccategoriaController.text;
    final String descricaoVal = myDescDescricaoController.text;

    if (nomeVal.isNotEmpty && descricaoVal.isNotEmpty && idadeVal.isNotEmpty) {
      final FilmesModel myFilmes = FilmesModel(
          nome: nomeVal, descricao: descricaoVal, categoria: idadeVal);
      Provider.of<FilmesProvider>(context, listen: false).addFilmes(myFilmes);
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
                  controller: myDesccategoriaController,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.blue),
                      labelText: "Digite categoria"),
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
