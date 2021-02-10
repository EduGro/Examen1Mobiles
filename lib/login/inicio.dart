import 'dart:ui';

import 'package:estructura_practica_1/login/ingreso.dart';
import 'package:estructura_practica_1/login/registro.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  final String title;
  Inicio({Key key, this.title}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF214254),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: new EdgeInsets.only(top: 100.0),
              child: Icon(
                Icons.local_cafe,
                color: Colors.white,
                size: 70,
              ),
            ),
            Container(
              child: Text(
                'cupping',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 70,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Container(
              padding: new EdgeInsets.only(top: 100.0),
              child: MaterialButton(
                child: Text(
                  "Registrate",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                minWidth: 350,
                color: Color(0xFF8B8175),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Registro()),
                  );
                },
              ),
            ),
            Container(
              padding: new EdgeInsets.only(top: 20.0),
              child: MaterialButton(
                child: Text(
                  "Iniciar Sesion",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                minWidth: 350,
                color: Color(0xFF8B8175),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Ingreso()),
                  );
                  //Navigator.of(context).pop("Clase de las 7am");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
