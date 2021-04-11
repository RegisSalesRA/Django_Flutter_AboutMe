import 'package:client/api/trabalho_api.dart';
import 'package:client/crud/trabalho_add.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Trabalho extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //Never forget to put providader context
      create: (context) => TrabalhoProvider(),
      child: MaterialApp(
        home: TrabalhoHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class TrabalhoHomePage extends StatefulWidget {
  @override
  _TrabalhoHomePageState createState() => _TrabalhoHomePageState();
}

class _TrabalhoHomePageState extends State<TrabalhoHomePage> {
  @override
  Widget build(BuildContext context) {
    final trabalhoMy = Provider.of<TrabalhoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Historico de trabalhos"),
      ),
      body: ListView.builder(
        // trabalhoMy is final trabalhoMy get a valor from Provider
        // my_Trabalho is list from api value
        itemCount: trabalhoMy.my_trabalho.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              direction: DismissDirection.endToStart,
              key: Key(trabalhoMy.my_trabalho[index].nome),
              onDismissed: (direction) {
                trabalhoMy.deleteViagens(trabalhoMy.my_trabalho[index]);
              },
              background: Container(
                color: Colors.red,
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              child: ListTile(
                title: Text(
                  trabalhoMy.my_trabalho[index].nome,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(trabalhoMy.my_trabalho[index].descricao,
                    style: TextStyle(
                        color: Colors.blue, fontStyle: FontStyle.italic)),
              ));
        },
      ),

//      BOTAO DE ADICIONAR
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => AddTrabalho()));
          }),
      //FIM BOTAO DE ADICIONAR
    );
  }
}
