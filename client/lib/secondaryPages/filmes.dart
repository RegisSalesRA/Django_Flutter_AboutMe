import 'package:client/api/filmes_api.dart';
import 'package:client/crud/filmes_add.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Filmes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FilmesProvider(),
      child: MaterialApp(
        home: FilmesHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class FilmesHomePage extends StatefulWidget {
  @override
  _FilmesHomePageState createState() => _FilmesHomePageState();
}

class _FilmesHomePageState extends State<FilmesHomePage> {
  @override
  Widget build(BuildContext context) {
    final filmesMy = Provider.of<FilmesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Viagens Marcantes"),
      ),
      body: ListView.builder(
        itemCount: filmesMy.my_filme.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              direction: DismissDirection.endToStart,
              key: Key(filmesMy.my_filme[index].nome),
              onDismissed: (direction) {
                filmesMy.deleteFilmes(filmesMy.my_filme[index]);
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
                  filmesMy.my_filme[index].categoria,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                title: Text(
                  filmesMy.my_filme[index].nome,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(filmesMy.my_filme[index].descricao,
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
                .push(MaterialPageRoute(builder: (ctx) => AddFilme()));
          }),
      //FIM BOTAO DE ADICIONAR
    );
  }
}
