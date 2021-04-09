import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Musicas extends StatefulWidget {
  @override
  _MusicasState createState() => _MusicasState();
}

class _MusicasState extends State<Musicas> {
  final items = List<String>.generate(5, (i) => "Item ${i + 1}");
  final title = "Musicas";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Dismissible(
            direction: DismissDirection.endToStart,
            key: Key(item),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });
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
              title: Text('$item'),
              subtitle: Text("subtitle"),
            ),
          );
        },
      ),
    );
  }
}
