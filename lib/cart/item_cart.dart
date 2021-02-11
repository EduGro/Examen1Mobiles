import 'package:flutter/material.dart';

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
                  children: [
                    Text("${prod.productTitle}",
                      style: TextStyle(
                        fontFamily: 'Akzidenz-Grotesk BQ',
                        fontSize: 15,
                      ),
                    ),
                    /*
                    SizedBox(
                      height: 12,
                    ),
                    Text("${widget.product.productTitle}"),
                    SizedBox(
                      height: 12,
                    ),
                    IconButton(icon: Icon(Icons.add_circle_outline), onPressed: _addProd),
                    SizedBox(
                      height: 12,
                    ),
                    IconButton(icon: Icon(Icons.remove_circle), onPressed: _remProd),
                    SizedBox(
                      height: 12,
                    ),
                    Text("${widget.product.productAmount}"),
                    SizedBox(
                      height: 12,
                    ),
                    Text("${widget.product.productPrice}"),
                    SizedBox(
                      height: 12,
                    ),*/
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
