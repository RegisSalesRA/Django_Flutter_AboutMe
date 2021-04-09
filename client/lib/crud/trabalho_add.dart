import 'package:client/api/trabalho_api.dart';

import 'package:client/model/trabalho_model.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AddTrabalho extends StatefulWidget {
  @override
  _AddTrabalhoState createState() => _AddTrabalhoState();
}

class _AddTrabalhoState extends State<AddTrabalho> {
  final myDescNomeController = TextEditingController();
  final myDescDescricaoController = TextEditingController();

  void onAdd() {
    final String nomeVal = myDescNomeController.text;
    final String descricaoVal = myDescDescricaoController.text;

    if (nomeVal.isNotEmpty && descricaoVal.isNotEmpty) {
      final TrabalhoModel myTrabalho =
          TrabalhoModel(nome: nomeVal, descricao: descricaoVal);
      Provider.of<TrabalhoProvider>(context, listen: false)
          .addTrabalho(myTrabalho);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Adicione um trabalho"),
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
