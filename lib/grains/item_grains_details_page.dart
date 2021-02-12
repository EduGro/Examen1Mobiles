import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/cart/payment_methods.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/utils/constants.dart';

class ItemGrainsDetailsPage extends StatefulWidget {
  final ProductGrains grain;
  ItemGrainsDetailsPage({
    Key key,
    @required this.grain,
  }) : super(key: key);

  @override
  ItemgrainsDetailsPageState createState() => ItemgrainsDetailsPageState();
}

class ItemgrainsDetailsPageState extends State<ItemGrainsDetailsPage> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var grain = widget.grain;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("${grain.productTitle}"),
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
                            grain.productImage, width: 200, height: 200, fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 160, top: 10),
                          child: grain.liked?Icon(Icons.favorite_outline):Icon(Icons.favorite, color: Colors.black),
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
                          Text("${grain.productTitle}",
                            style: TextStyle(
                              fontFamily: 'Akzidenz-Grotesk BQ',
                              fontWeight: FontWeight.bold,
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
                              Text("${grain.productDescription}",
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
                    Column(
                      children: [
                        Text(
                          "TAMAÑOS DISPONIBLES",
                          style: TextStyle(
                            fontFamily: 'Akzidenz-Grotesk BQ',
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0,),
                      child: Column(
                        children: [
                          Text(
                            "\$${grain.productPrice}",
                            style: TextStyle(
                              fontFamily: 'Akzidenz-Grotesk BQ',
                              fontWeight: FontWeight.w600,
                              fontSize: 30,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: FlatButton(
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                            color: grain.productWeight==ProductWeight.CUARTO ? Color.fromARGB(0xFF, 0xFA, 0xBF, 0x7C):Colors.white,
                            child: Text(
                              "Cuarto",
                              style: TextStyle(
                                fontFamily: 'Akzidenz-Grotesk BQ',
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),
                            ),
                            onPressed: (){
                              setState(() {
                                grain.productWeight = ProductWeight.CUARTO;
                                grain.productPrice = grain.productPriceCalculator();
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: FlatButton(
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                            color: grain.productWeight==ProductWeight.KILO ? Color.fromARGB(0xFF, 0xFA, 0xBF, 0x7C):Colors.white,
                            child: Text(
                              "Kilo",
                              style: TextStyle(
                                fontFamily: 'Akzidenz-Grotesk BQ',
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),
                            ),
                            onPressed: (){
                              setState(() {
                                grain.productWeight = ProductWeight.KILO;
                                grain.productPrice = grain.productPriceCalculator();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                )
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
                                productTitle: grain.productTitle, 
                                productAmount: ++grain.productAmount,
                                productPrice: grain.productPrice,
                                productImage: grain.productImage,
                                productDesc: grain.productDescription,
                                productLiked: grain.liked
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
                                productTitle: widget.grain.productTitle, 
                                productAmount: ++widget.grain.productAmount, 
                                productPrice: widget.grain.productPrice,
                                productImage: widget.grain.productImage,
                                productDesc: widget.grain.productDescription,
                                productLiked: widget.grain.liked
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