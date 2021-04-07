import 'package:flutter/material.dart';

class Musicas extends StatefulWidget {
  @override
  _MusicasState createState() => _MusicasState();
}

class _MusicasState extends State<Musicas> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Musicas"),
    );
  }
}

/*
import 'package:flutter/material.dart';

class Musicas extends StatefulWidget {
  @override
  _MusicasState createState() => _MusicasState();
}

class _MusicasState extends State<Musicas> {
  List _musicas = ["Van halen", "Iron maiden", "Aerosmith"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _musicas.length,
              itemBuilder: (context, indice) {
                return ListTile(title: Text(_musicas[indice]));
              },
            ),
          )
        ],
      ),
    );
  }
}
*/
