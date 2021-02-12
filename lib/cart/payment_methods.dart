import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';

class PaymentMethodsPage extends StatefulWidget {
  final List<ProductItemCart> productsList;
  PaymentMethodsPage({
    Key key,
    @required this.productsList,
  }) : super(key: key);

  @override
  PaymentMethodsPageState createState() => PaymentMethodsPageState();
}

class PaymentMethodsPageState extends State<PaymentMethodsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagos"),
      ),
      body: Container(
        ),
    );
  }
}