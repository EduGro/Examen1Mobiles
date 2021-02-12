import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/desserts/item_desserts_details.dart';

class ItemDesserts extends StatefulWidget {
  final ProductDesserts dessert;
  ItemDesserts({
    Key key,
    @required this.dessert,
  }) : super(key: key);

  @override
  _ItemDessertsState createState() => _ItemDessertsState();
}

class _ItemDessertsState extends State<ItemDesserts> {
  @override
  Widget build(BuildContext context) {
    var dessert = widget.dessert;
    return Container(
      child: GestureDetector(
        onTap: _openDetails,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                color: Color.fromARGB(0xFF, 0xBC, 0xB0, 0xA1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 1.0, left: 16.0, top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            child: Text(
                              "${dessert.productTitle}",
                              style: TextStyle(
                              fontFamily: 'Akzidenz-Grotesk BQ',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 24.0, bottom: 24.0,),
                            child: Container(
                              width: MediaQuery.of(context).size.width/3,
                              child: Text(
                                "${dessert.productDescription}",
                                style: TextStyle(
                                  fontFamily: 'Akzidenz-Grotesk BQ',
                                  fontSize: 20,
                                  color: Colors.white
                                )
                              ),
                            ),
                          ),
                          Text(
                            "\$${dessert.productPrice}",
                            style: TextStyle(
                              fontFamily: 'Akzidenz-Grotesk BQ',
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            dessert.productImage, 
                            width: 100,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 1.0, top: 8.0),
                      child: Column(
                        children: [
                          dessert.liked?Icon(Icons.favorite_outline):Icon(Icons.favorite, color: Colors.black),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openDetails() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ItemDessertsDetailsPage(dessert: widget.dessert,);
        },
      ),
    );
  }
}
