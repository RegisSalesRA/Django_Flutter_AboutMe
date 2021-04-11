import 'package:client/api/games_api.dart';
import 'package:client/crud/games_add.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Games extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //Never forget to put providader context
      create: (context) => GamesProvider(),
      child: MaterialApp(
        home: GamesHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class GamesHomePage extends StatefulWidget {
  @override
  _GamesHomePageState createState() => _GamesHomePageState();
}

class _GamesHomePageState extends State<GamesHomePage> {
  @override
  Widget build(BuildContext context) {
    final gamesMy = Provider.of<GamesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Games preferidas"),
      ),
      body: ListView.builder(
        // gamesMy is final gamesMy get a valor from Provider
        // my_game is list from api value
        itemCount: gamesMy.my_games.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              direction: DismissDirection.endToStart,
              key: Key(gamesMy.my_games[index].nome),
              onDismissed: (direction) {
                gamesMy.deleteGames(gamesMy.my_games[index]);
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
                  gamesMy.my_games[index].genero,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                title: Text(
                  gamesMy.my_games[index].nome,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(gamesMy.my_games[index].descricao,
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
                .push(MaterialPageRoute(builder: (ctx) => AddGames()));
          }),
      //FIM BOTAO DE ADICIONAR
    );
  }
}
