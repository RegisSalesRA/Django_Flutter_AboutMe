import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'adicionartest.dart';
import 'api/testeapi.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyDescriptionProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final descriptionMy = Provider.of<MyDescriptionProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("To do List"),
      ),
      body: ListView.builder(
        itemCount: descriptionMy.my_description.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                descriptionMy.deleteToDo(descriptionMy.my_description[index]);
              },
            ),
            title: Text(
              descriptionMy.my_description[index].nome,
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            subtitle: Text(descriptionMy.my_description[index].idade,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => AddTodoScreen()));
          }),
    );
  }
}
