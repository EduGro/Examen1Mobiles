import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/cart/payment_methods.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/utils/constants.dart';

class ItemDessertsDetailsPage extends StatefulWidget {
  final ProductDesserts dessert;
  ItemDessertsDetailsPage({
    Key key,
    @required this.dessert,
  }) : super(key: key);

  @override
  ItemDessertsDetailsPageState createState() => ItemDessertsDetailsPageState();
}

class ItemDessertsDetailsPageState extends State<ItemDessertsDetailsPage> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var dessert = widget.dessert;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("${dessert.productTitle}"),
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
                            dessert.productImage, width: 200, height: 200, fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 160, top: 10),
                          child: dessert.liked?Icon(Icons.favorite_outline):Icon(Icons.favorite, color: Colors.black),
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
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text("${dessert.productTitle}",
                              style: TextStyle(
                                fontFamily: 'Akzidenz-Grotesk BQ',
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
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
                              Text("${dessert.productDescription}",
                                style: TextStyle(
                                  fontFamily: 'Akzidenz-Grotesk BQ',
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
              Padding(
                padding: EdgeInsets.only(top: 8.0, left: 24.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0,),
                      child: Column(
                        children: [
                          Text(
                            "\$${dessert.productPrice}",
                            style: TextStyle(
                              fontFamily: 'Akzidenz-Grotesk BQ',
                              fontWeight: FontWeight.w600,
                              fontSize: 30,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, top: 48.0),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          MaterialButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            padding: EdgeInsets.all(20.0),
                            color: Color.fromARGB(0xFF, 0xBC, 0xB0, 0xA1),
                            child: Text(
                              "AGREGAR AL CARRITO",
                              style: TextStyle(
                                fontFamily: 'Akzidenz-Grotesk BQ',
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: (){
                              ProductItemCart prod = ProductItemCart(
                                productTitle: dessert.productTitle, 
                                productAmount: ++dessert.productAmount,
                                productPrice: dessert.productPrice,
                                productImage: dessert.productImage,
                                productDesc: dessert.productDescription,
                                productLiked: dessert.liked
                              );
                              cartList.add(prod);
                              _scaffoldKey.currentState
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                SnackBar(
                                  content: Text("Producto añadido al carrito")
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          MaterialButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            padding: EdgeInsets.all(20.0),
                            color: Color.fromARGB(0xFF, 0xBC, 0xB0, 0xA1),
                            child: Text(
                              "COMPRAR AHORA",
                              style: TextStyle(
                                fontFamily: 'Akzidenz-Grotesk BQ',
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: (){
                              List<ProductItemCart> productList = [];
                              ProductItemCart prod = ProductItemCart(
                                productTitle: widget.dessert.productTitle, 
                                productAmount: ++widget.dessert.productAmount, 
                                productPrice: widget.dessert.productPrice,
                                productImage: widget.dessert.productImage,
                                productDesc: widget.dessert.productDescription,
                                productLiked: widget.dessert.liked
                              );
                              productList.add(prod);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return PaymentMethodsPage(productsList: productList);
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}