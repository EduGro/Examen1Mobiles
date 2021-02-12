import 'package:flutter/material.dart';
import 'package:estructura_practica_1/utils/constants.dart';

class ItemCart extends StatefulWidget {
  final dynamic product;
  final ValueChanged<double> onAmountUpdated;
  ItemCart({
    Key key,
    @required this.onAmountUpdated,
    @required this.product,
  }) : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {

    void _delProd() {
    setState(() {
      //cartList.remove(widget.product);
    });
  }

    var prod = widget.product;
    return Card(
      color: Color.fromARGB(0xFF, 0xEC, 0x97, 0x62),
      margin: EdgeInsets.all(24),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        prod.productImage, 
                        width: 120,
                        height: 120,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.0),
                          width: 100,
                          child: Column (
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("${prod.productTitle}",
                                style: TextStyle(
                                  fontFamily: 'Akzidenz-Grotesk BQ',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Text("${prod.productDesc}",
                                  style: TextStyle(
                                    fontFamily: 'Akzidenz-Grotesk BQ',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            prod.productLiked?Icon(Icons.favorite_outline):Icon(Icons.favorite, color: Colors.black),
                            //IconButton(icon: Icon(Icons.delete), onPressed: _delProd),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(icon: Icon(Icons.add_circle_outline), onPressed: _addProd),
                        Text(
                          "${prod.productAmount}",
                          style: TextStyle(
                                fontFamily: 'Akzidenz-Grotesk BQ',
                                fontSize: 18,
                              ),
                        ),
                        IconButton(icon: Icon(Icons.remove_circle_outline), onPressed: _remProd),
                        Text(
                          "${prod.productPrice}",
                          style: TextStyle(
                                fontFamily: 'Akzidenz-Grotesk BQ',
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addProd() {
    setState(() {
      ++widget.product.productAmount;
    });
    widget.onAmountUpdated(widget.product.productPrice);
  }

  void _remProd() {
    setState(() {
      --widget.product.productAmount;
    });
    widget.onAmountUpdated(-1 * widget.product.productPrice);
  }
}
