import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/drinks/item_hot_drinks_details.dart';

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
      child: GestureDetector(
        onTap: _openDetails,
        child: Card(
          color: Color.fromARGB(0xFF, 0xBC, 0xB0, 0xA1),
          child: (
            ListTile(
              leading: Image.network(drink.productImage,),
              title: Text(
                "${drink.productTitle}",
                style: TextStyle(
                  fontFamily: 'Akzidenz-Grotesk BQ Medium',
                  fontSize: 15,
                )
              ),
              subtitle: Column(
                children: [
                  Text(
                    "${drink.productDescription}",
                    style: TextStyle(
                      fontFamily: 'Akzidenz-Grotesk BQ Medium',
                      fontSize: 20,
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
              trailing: drink.liked?Icon(Icons.favorite_outline):Icon(Icons.favorite, color: Colors.black), 
            )
          ),
        ),
      ),
    );
  }

  void _openDetails() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ItemHotDrinksDetailsPage(drink: widget.drink,);
        },
      ),
    );
  }
}
