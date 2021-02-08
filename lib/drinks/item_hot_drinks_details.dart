import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

class ItemHotDrinksDetailsPage extends StatefulWidget {
  final ProductHotDrinks drink;
  ItemHotDrinksDetailsPage({
    Key key,
    @required this.drink,
  }) : super(key: key);

  @override
  ItemHotDrinksDetailsPageState createState() => ItemHotDrinksDetailsPageState();
}

class ItemHotDrinksDetailsPageState extends State<ItemHotDrinksDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var drink = widget.drink;
    return Scaffold(
      appBar: AppBar(
        title: Text("${drink.productTitle}"),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: <Widget>[
                        Container(
                          child: Image.network(
                            drink.productImage, width: 200, height: 200, fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 160, top: 10),
                          child: drink.liked?Icon(Icons.favorite_outline):Icon(Icons.favorite),
                        )
                      ]
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("${drink.productTitle}",
                            style: TextStyle(
                              fontFamily: 'Akzidenz-Grotesk BQ Medium',
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 8.0, left: 8.0),
                          width: 300,
                          child: new Column (
                            children: <Widget>[
                              Text("${drink.productDescription}",
                          style: TextStyle(
                            fontFamily: 'Akzidenz-Grotesk BQ Light',
                            fontSize: 20,
                          ),
                        ),
                            ],
                          ),
                        ),
                        
                      ],
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text("Tamaños disponibles:")
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}