import 'package:estructura_practica_1/login/inicio.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/utils/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: ThemeData(
        //primaryColor: PRIMARY_COLOR,
        primarySwatch: PRIMARY_COLOR,
        fontFamily: 'Akzidenz-Grotesk BQ',
      ),
      home: Inicio(title: APP_TITLE),
    );
  }
}
