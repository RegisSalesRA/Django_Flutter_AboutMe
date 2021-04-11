import 'package:client/pages/login.dart';
import 'package:client/primaryPages/hobbies.dart';
import 'package:client/primaryPages/home.dart';
import 'package:client/primaryPages/professions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> with SingleTickerProviderStateMixin {
  //SingleTickerProviderStateMixin controle das animações de pagina
  List<String> itensMenu = ["Configurações", "Deslogar"];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  _escolhaMenuItem(String itemEscolhido) {
    switch (itemEscolhido) {
      case "Configurações":
        Navigator.pushNamed(context, "/configuracoes");
        print("configuracao");
        break;
      case "Deslogar":
        _deslogarUsuario();

        break;
    }
  }

  _deslogarUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("About me"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: "Home",
              icon: Icon(Icons.home),
            ),
            Tab(
              text: "Hobbies",
              icon: Icon(Icons.contacts),
            ),
            Tab(
              text: "Professions",
              icon: Icon(Icons.work),
            )
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            // Ação quando escolher a opção
            onSelected: _escolhaMenuItem,
            // Opções do menu
            itemBuilder: (context) {
              return itensMenu.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
          )
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Home(),
          Hobbies(),
          Professions(),
        ],
      ),
    );
  }
}
