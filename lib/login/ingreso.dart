import 'package:estructura_practica_1/home/home.dart';
import 'package:estructura_practica_1/login/registro.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Ingreso extends StatefulWidget {
  Ingreso({Key key}) : super(key: key);

  @override
  _IngresoState createState() => _IngresoState();
}

class _IngresoState extends State<Ingreso> {
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
                size: 60,
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
              padding: new EdgeInsets.only(top: 75.0, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Nombre Completo",
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'John Doe',
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ],
              ),
            ),
            Container(
              padding: new EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Contraseña",
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: new EdgeInsets.only(top: 30.0),
              child: MaterialButton(
                child: Text(
                  "ENTRAR",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                minWidth: 350,
                height: 50,
                color: Color(0xFF8B8175),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => Home(title: APP_TITLE)),
                  );
                },
              ),
            ),
            Container(
              padding: new EdgeInsets.only(top: 40.0),
              child: new RichText(
                textAlign: TextAlign.center,
                text: new TextSpan(
                  children: [
                    new TextSpan(
                      text: '¿Olvidaste tu password?',
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Ingreso()),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: new EdgeInsets.only(top: 75.0),
              child: new RichText(
                textAlign: TextAlign.center,
                text: new TextSpan(
                  children: [
                    new TextSpan(
                      text: '¿Aún no tienes una cuenta?\n',
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    new TextSpan(
                      text: 'REGÍSTRATE',
                      style: new TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Registro()),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
