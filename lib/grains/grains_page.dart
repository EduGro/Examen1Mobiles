import 'package:estructura_practica_1/grains/item_grains_page.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_grains.dart';

class GrainsPage extends StatelessWidget {
  final List<ProductGrains> grainsList;
  GrainsPage({
    Key key,
    @required this.grainsList, List drinksList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bebidas"),
      ),
      body: ListView.builder(
        itemCount: grainsList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemGrains(
            grain: grainsList[index],
          );
        },
      ),
    );
  }
}
