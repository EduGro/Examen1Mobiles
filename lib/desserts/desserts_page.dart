import 'package:estructura_practica_1/desserts/item_desserts_page.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';

class DessertsPage extends StatelessWidget {
  final List<ProductDesserts> dessertsList;
  DessertsPage({
    Key key,
    @required this.dessertsList, List drinksList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bebidas"),
      ),
      body: ListView.builder(
        itemCount: dessertsList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemDesserts(
            dessert: dessertsList[index],
          );
        },
      ),
    );
  }
}
