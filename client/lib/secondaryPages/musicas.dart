import 'package:client/api/musicas_api.dart';
import 'package:client/crud/musica_add.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Musicas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //Never forget to put providader context
      create: (context) => MusicasProvider(),
      child: MaterialApp(
        home: MusicasHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MusicasHomePage extends StatefulWidget {
  @override
  _MusicasHomePageState createState() => _MusicasHomePageState();
}

class _MusicasHomePageState extends State<MusicasHomePage> {
  @override
  Widget build(BuildContext context) {
    final musicasMy = Provider.of<MusicasProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Viagens Marcantes"),
      ),
      body: ListView.builder(
        // musicasMy is final musicasMy get a valor from Provider
        // my_musica is list from api value
        itemCount: musicasMy.my_musica.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              direction: DismissDirection.endToStart,
              key: Key(musicasMy.my_musica[index].nome),
              onDismissed: (direction) {
                musicasMy.deleteViagens(musicasMy.my_musica[index]);
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
                  musicasMy.my_musica[index].album,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                title: Text(
                  musicasMy.my_musica[index].nome,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(musicasMy.my_musica[index].descricao,
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
                .push(MaterialPageRoute(builder: (ctx) => AddMusicas()));
          }),
      //FIM BOTAO DE ADICIONAR
    );
  }
}
