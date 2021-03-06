import 'package:estructura_practica_1/login/inicio.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/utils/constants.dart';

import 'cart/cart.dart';

class Profile extends StatelessWidget {
  final String title;
  final Map<String, String> usuario;
  const Profile({Key key, this.title, this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PROFILE_TITLE),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return Cart(
                      productsList: cartList,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 150,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      PROFILE_PICTURE,
                    ),
                    minRadius: 40,
                    maxRadius: 80,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  usuario["nombre"],
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(usuario["email"]),
                SizedBox(
                  height: 16,
                ),
                ListTile(
                  title: Text(PROFILE_CART),
                  leading: Icon(Icons.shopping_cart),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(PROFILE_WISHES),
                  leading: Icon(Icons.thumb_up),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(PROFILE_HISTORY),
                  leading: Icon(Icons.store),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(PROFILE_SETTINGS),
                  leading: Icon(Icons.settings),
                  onTap: () {},
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: Text(PROFILE_LOGOUT),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => Inicio(title: title)),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
