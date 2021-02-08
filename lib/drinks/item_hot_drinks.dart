import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

class ItemHotDrinks extends StatefulWidget {
  final ProductHotDrinks drink;
  ItemHotDrinks({
    Key key,
    @required this.drink,
  }) : super(key: key);

  @override
  _ItemHotDrinksState createState() => _ItemHotDrinksState();
}

class _ItemHotDrinksState extends State<ItemHotDrinks> {
  @override
  Widget build(BuildContext context) {
    var drink = widget.drink;
    return Container(
      child: Card(
        color: Color.fromARGB(0xFF, 0xBC, 0xB0, 0xA1),
        child: (
          ListTile(
            leading: Image.network(drink.productImage, fit: BoxFit.cover),
            title: Text(
              "${drink.productTitle}",
              style: TextStyle(fontFamily: 'Akzidenz-Grotesk BQ Medium')
            ),
            subtitle: Column(
              children: [
                Text(
                  "${drink.productDescription}",
                  style: TextStyle(
                    fontFamily: 'Akzidenz-Grotesk BQ Medium', 
                    color: Colors.white
                  )
                ),
                Text(
                  "\$${drink.productPrice}",
                  style: TextStyle(
                    fontFamily: 'Akzidenz-Grotesk BQ Medium',
                    fontSize: 25,
                  )
                ),
              ],
            ),
            trailing: drink.liked?Icon(Icons.favorite_outline):Icon(Icons.favorite), 
          )
        ),
      ),
    );
  }
}
