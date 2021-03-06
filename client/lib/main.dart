import 'package:client/pages/login.dart';
import 'package:client/routeGenerator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Login(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Color(0xff1E90FF), accentColor: Color(0xff87CEFA)),
    initialRoute: "/",
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}
