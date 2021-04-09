import 'package:client/api/musicas_api.dart';
import 'package:client/api/viagens_api.dart';
import 'package:client/model/musicas_model.dart';
import 'package:client/model/viagem_model.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AddMusicas extends StatefulWidget {
  @override
  _AddMusicasState createState() => _AddMusicasState();
}

class _AddMusicasState extends State<AddMusicas> {
  final myDescNomeController = TextEditingController();
  final myDescAlbumController = TextEditingController();
  final myDescDescricaoController = TextEditingController();

  void onAdd() {
    final String nomeVal = myDescNomeController.text;
    final String albumVal = myDescAlbumController.text;
    final String descricaoVal = myDescDescricaoController.text;

    if (nomeVal.isNotEmpty && descricaoVal.isNotEmpty && albumVal.isNotEmpty) {
      final MusicasModel myMusica =
          MusicasModel(nome: nomeVal, descricao: descricaoVal, album: albumVal);
      Provider.of<MusicasProvider>(context, listen: false).addMusicas(myMusica);
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
                  controller: myDescAlbumController,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.blue),
                      labelText: "Digite Album"),
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
