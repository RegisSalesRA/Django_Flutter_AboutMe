import 'package:client/primaryPages/hobbies.dart';
import 'package:client/primaryPages/home.dart';
import 'package:client/primaryPages/professions.dart';
import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> with SingleTickerProviderStateMixin {
  //SingleTickerProviderStateMixin controle das animações de pagina

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Abas"),
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
