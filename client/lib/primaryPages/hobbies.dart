import 'package:client/secondaryPages/filmes.dart';
import 'package:client/secondaryPages/games.dart';
import 'package:client/secondaryPages/musicas.dart';
import 'package:client/secondaryPages/viagens.dart';
import 'package:flutter/material.dart';

class Hobbies extends StatefulWidget {
  @override
  _HobbiesState createState() => _HobbiesState();
}

class _HobbiesState extends State<Hobbies> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: GridView.count(
      crossAxisCount: 2,
      children: [
        InkWell(
          splashColor: Colors.blue, // splash color
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => Viagens()));
          }, // button pressed
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.airplanemode_active,
                size: 150,
                color: Colors.blue,
              ), // icon
              Text("Viagens"), // text
            ],
          ),
        ),
        InkWell(
          splashColor: Colors.blue, // splash color
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => Filme()));
          }, // button pressed
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.local_movies,
                size: 150,
                color: Colors.blue,
              ), // icon
              Text("Movies"), // text
            ],
          ),
        ),
        InkWell(
          splashColor: Colors.blue, // splash color
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => Musicas()));
          }, // button pressed
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.queue_music,
                size: 150,
                color: Colors.blue,
              ), // icon
              Text("Musicas"), // text
            ],
          ),
        ),
        InkWell(
          splashColor: Colors.blue, // splash color
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => Game()));
          }, // button pressed
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.games,
                size: 150,
                color: Colors.blue,
              ), // icon
              Text("Games"), // text
            ],
          ),
        ),
      ],
    ));
  }
}

/*
           Icons.games,
            
            Icons.queue_music,
            
            Icons.local_movies,
            Icons.airplanemode_active,
            */
