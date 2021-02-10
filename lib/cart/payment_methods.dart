import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

class PaymentMethodsPage extends StatefulWidget {
  final ProductHotDrinks drink;
  PaymentMethodsPage({
    Key key,
    @required this.drink,
  }) : super(key: key);

  @override
  PaymentMethodsPageState createState() => PaymentMethodsPageState();
}

class PaymentMethodsPageState extends State<PaymentMethodsPage> {
  @override
  Widget build(BuildContext context) {
    var drink = widget.drink;
    return Scaffold(
      appBar: AppBar(
        title: Text("${drink.productTitle}"),
      ),
      body: Container(
        ),
    );
  }
}