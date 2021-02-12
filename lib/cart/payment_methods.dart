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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30.0, left: 24.0, bottom: 12.0),
            child: Text("Elige tu método de pago:",
              style: TextStyle(
                fontFamily: 'Akzidenz-Grotesk BQ',
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
          ),
          GestureDetector(
            onTap: _buy,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                color: Color.fromARGB(0xFF, 0xBC, 0xB0, 0xA1),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Image.asset("assets/images/credcard.png",
                          width: 75,
                          height: 75,
                        ),
                      ),
                      Container(
                        width: 150,
                        child: Text("Tarjeta de crédito",
                          style: TextStyle(
                            fontFamily: 'Akzidenz-Grotesk BQ',
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Colors.white
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 100.0),
                        child: Icon(Icons.edit),
                      ),
                    ],
                  )
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: _buy,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                color: Color.fromARGB(0xFF, 0xBC, 0xB0, 0xA1),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Image.asset("assets/images/paypal.png",
                          width: 75,
                          height: 75,
                        ),
                      ),
                      Container(
                        width: 150,
                        child: Text("PayPal",
                          style: TextStyle(
                            fontFamily: 'Akzidenz-Grotesk BQ',
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Colors.white
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 100.0),
                        child: Icon(Icons.edit),
                      ),
                    ],
                  )
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: _buy,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                color: Color.fromARGB(0xFF, 0xBC, 0xB0, 0xA1),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Image.asset("assets/images/giftcard.png",
                          width: 75,
                          height: 75,
                        ),
                      ),
                      Container(
                        width: 150,
                        child: Text("Tarjeta de regalo",
                          style: TextStyle(
                            fontFamily: 'Akzidenz-Grotesk BQ',
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Colors.white
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 100.0),
                        child: Icon(Icons.edit),
                      ),
                    ],
                  )
                ),
              ), 
            ),
          )
        ],
      ),
    );
  }

  void _buy() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("¡Orden exitosa!",
            style: TextStyle(
              fontFamily: 'Akzidenz-Grotesk BQ',
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black
            ),
          ),
          content: Text("Tu orden ha sido registrada, para más información busca en la opción historial de compras en tu perfil.",
            style: TextStyle(
              fontFamily: 'Akzidenz-Grotesk BQ',
              fontWeight: FontWeight.w300,
              fontSize: 20,
              color: Colors.black
            ),
          ),
          actions: [
            MaterialButton(
              child: Text("Aceptar",
                style: TextStyle(
                fontFamily: 'Akzidenz-Grotesk BQ',
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: Color.fromARGB(0xFF, 0x21, 0x42, 0x54)
              ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}