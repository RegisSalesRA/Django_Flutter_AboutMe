import 'package:client/secondaryPages/musica.dart';
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
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => Musicas()));
          },
          child: Icon(
            Icons.queue_music,
            size: 150,
            color: Colors.blue,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.ac_unit,
            size: 150,
            color: Colors.blue,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.ac_unit,
            size: 150,
            color: Colors.blue,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.ac_unit,
            size: 150,
            color: Colors.blue,
          ),
        ),
      ],
    ));
  }
}
