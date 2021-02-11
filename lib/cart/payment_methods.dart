import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_cart.dart';

class PaymentMethodsPage extends StatefulWidget {
  final dynamic prod;
  PaymentMethodsPage({
    Key key,
    @required this.prod,
  }) : super(key: key);

  @override
  PaymentMethodsPageState createState() => PaymentMethodsPageState();
}

class PaymentMethodsPageState extends State<PaymentMethodsPage> {
  @override
  Widget build(BuildContext context) {
    var drink = widget.prod;
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagos"),
      ),
      body: Container(
        ),
    );
  }
}