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
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue, //                   <--- border color
                  width: 5.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.airplanemode_active,
                    size: 150,
                    color: Colors.blue,
                  ), // icon
                  Text(
                    "Viagens",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ), // text
                ],
              ),
            )),
        InkWell(
            splashColor: Colors.blue, // splash color
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => Filmes()));
            }, // button pressed
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue, //                   <--- border color
                  width: 5.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.local_movies,
                    size: 150,
                    color: Colors.blue,
                  ), // icon
                  Text(
                    "Filmes",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ), // text
                ],
              ),
            )),
        InkWell(
            splashColor: Colors.blue, // splash color
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => Musicas()));
            }, // button pressed
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue, //                   <--- border color
                  width: 5.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.queue_music,
                    size: 150,
                    color: Colors.blue,
                  ), // icon
                  Text(
                    "Musicas",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ), // text
                ],
              ),
            )),
        InkWell(
            splashColor: Colors.blue, // splash color
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => Games()));
            }, // button pressed
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue, //                   <--- border color
                  width: 5.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.games,
                    size: 150,
                    color: Colors.blue,
                  ), // icon
                  Text(
                    "Games",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ), // text
                ],
              ),
            )),
      ],
    ));
  }
}
