import 'package:estructura_practica_1/grains/grains_page.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/home/item_home.dart';
import 'package:estructura_practica_1/profile.dart';
import 'package:estructura_practica_1/drinks/hot_drinks_page.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:estructura_practica_1/desserts/desserts_page.dart';

class Home extends StatefulWidget {
  final String title;
  final Map<String, String> usuario;
  Home({Key key, this.title, this.usuario}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  void showSnacks(String text) {
    _scaffoldKey.currentState
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(text),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          /*IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Drawer(
                child: Profile(
                  title: widget.title,
                  usuario: widget.usuario,
                ),
              );
            },
          ),*/
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
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: _openHotDrinksPage,
            child: ItemHome(
              title: "Bebidas calientes",
              image: "https://i.imgur.com/XJ0y9qs.png",
            ),
          ),
          GestureDetector(
            onTap: _openDessertPage,
            child: ItemHome(
              title: "Postres",
              image: "https://i.imgur.com/fI7Tezv.png",
            ),
          ),
          GestureDetector(
            onTap: _openGrainsPage,
            child: ItemHome(
              title: "Granos",
              image: "https://i.imgur.com/5MZocC1.png",
            ),
          ),
          GestureDetector(
            onTap: () => showSnacks("Proximamente"),
            child: ItemHome(
              title: "Tazas",
              image: "https://i.imgur.com/fMjtSpy.png",
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Profile(
          title: widget.title,
          usuario: widget.usuario,
        ),
      ),
    );
  }

  void _openHotDrinksPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return HotDrinksPage(
            drinksList: ProductRepository.loadProducts(ProductType.BEBIDAS),
          );
        },
      ),
    );
  }

  void _openGrainsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return GrainsPage(
            grainsList: ProductRepository.loadProducts(ProductType.GRANO),
          );
        },
      ),
    );
  }

  void _openDessertPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return DessertsPage(
            dessertsList: ProductRepository.loadProducts(ProductType.POSTRES),
          );
        },
      ),
    );
  }

  void _openTazasPage() {
    showSnacks("Proximamente");
  }
}
