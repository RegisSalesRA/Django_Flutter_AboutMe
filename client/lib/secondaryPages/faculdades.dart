import 'package:client/api/faculdade_api.dart';
import 'package:client/crud/faculdade_add.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Faculdade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //Never forget to put providader context
      create: (context) => FaculdadeProvider(),
      child: MaterialApp(
        home: FaculdadeHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class FaculdadeHomePage extends StatefulWidget {
  @override
  _FaculdadeHomePageState createState() => _FaculdadeHomePageState();
}

class _FaculdadeHomePageState extends State<FaculdadeHomePage> {
  @override
  Widget build(BuildContext context) {
    final faculdadeMy = Provider.of<FaculdadeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Faculdades"),
      ),
      body: ListView.builder(
        // faculdadeMy is final faculdadeMy get a valor from Provider
        // my_faculdade is list from api value
        itemCount: faculdadeMy.my_faculdade.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              direction: DismissDirection.endToStart,
              key: Key(faculdadeMy.my_faculdade[index].nome),
              onDismissed: (direction) {
                faculdadeMy.deleteFaculdade(faculdadeMy.my_faculdade[index]);
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
                title: Text(
                  faculdadeMy.my_faculdade[index].nome,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(faculdadeMy.my_faculdade[index].curso,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue,
                        fontStyle: FontStyle.italic)),
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
                .push(MaterialPageRoute(builder: (ctx) => AddFaculdade()));
          }),
      //FIM BOTAO DE ADICIONAR
    );
  }
}
