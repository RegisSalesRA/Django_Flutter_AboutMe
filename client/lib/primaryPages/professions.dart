import 'package:client/secondaryPages/faculdades.dart';
import 'package:client/secondaryPages/jobs.dart';
import 'package:client/secondaryPages/musicas.dart';
import 'package:flutter/material.dart';

class Professions extends StatefulWidget {
  @override
  _ProfessionsState createState() => _ProfessionsState();
}

class _ProfessionsState extends State<Professions> {
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
                .push(MaterialPageRoute(builder: (ctx) => Faculdade()));
          }, // button pressed
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.school,
                size: 150,
                color: Colors.blue,
              ), // icon
              Text("School"), // text
            ],
          ),
        ),
        InkWell(
          splashColor: Colors.blue, // splash color
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => Trabalho()));
          }, // button pressed
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.work,
                size: 150,
                color: Colors.blue,
              ), // icon
              Text("Jobs"), // text
            ],
          ),
        ),
      ],
    ));
  }
}
