import 'package:client/api/viagens_api.dart';
import 'package:client/crud/viagem_add.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Viagens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //Never forget to put providader context
      create: (context) => ViagensProvider(),
      child: MaterialApp(
        home: ViagemHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class ViagemHomePage extends StatefulWidget {
  @override
  _ViagemHomePageState createState() => _ViagemHomePageState();
}

class _ViagemHomePageState extends State<ViagemHomePage> {
  @override
  Widget build(BuildContext context) {
    final viagensMy = Provider.of<ViagensProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Viagens Marcantes"),
      ),
      body: ListView.builder(
        // viagensMy is final viagensMy get a valor from Provider
        // my_viagem is list from api value
        itemCount: viagensMy.my_viagem.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              direction: DismissDirection.endToStart,
              key: Key(viagensMy.my_viagem[index].nome),
              onDismissed: (direction) {
                viagensMy.deleteViagens(viagensMy.my_viagem[index]);
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
                trailing: Text(
                  viagensMy.my_viagem[index].local,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                title: Text(
                  viagensMy.my_viagem[index].nome,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(viagensMy.my_viagem[index].descricao,
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
                .push(MaterialPageRoute(builder: (ctx) => AddViagem()));
          }),
      //FIM BOTAO DE ADICIONAR
    );
  }
}
