import 'package:client/pages/cadastro.dart';
import 'package:client/pages/configuracao.dart';
import 'package:client/pages/index.dart';
import 'package:client/pages/login.dart';
import 'package:client/secondaryPages/musicas.dart';
import 'package:flutter/material.dart';

import 'primaryPages/hobbies.dart';
import 'primaryPages/home.dart';
import 'primaryPages/professions.dart';
import 'secondaryPages/faculdades.dart';
import 'secondaryPages/filmes.dart';
import 'secondaryPages/games.dart';
import 'secondaryPages/jobs.dart';
import 'secondaryPages/viagens.dart';

// Navigator.pushNamed(context, "/configuracoes");

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => Login());
      case "/login":
        return MaterialPageRoute(builder: (_) => Login());
      case "/cadastro":
        return MaterialPageRoute(builder: (_) => Cadastro());
      case "/index":
        return MaterialPageRoute(builder: (_) => Index());
      case "/configuracoes":
        return MaterialPageRoute(builder: (_) => Configuracoes());
      case "/filmes":
        return MaterialPageRoute(builder: (_) => Filmes());
      case "/games":
        return MaterialPageRoute(builder: (_) => Games());
      case "/viagens":
        return MaterialPageRoute(builder: (_) => Viagens());
      case "/musicas":
        return MaterialPageRoute(builder: (_) => Musicas());
      case "/jobs":
        return MaterialPageRoute(builder: (_) => Trabalho());
      case "/faculdades":
        return MaterialPageRoute(builder: (_) => Faculdade());

      default:
        _erroRota();
    }
  }

  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Tela não encontrada!"),
        ),
        body: Center(
          child: Text("Tela não encontrada!"),
        ),
      );
    });
  }
}
