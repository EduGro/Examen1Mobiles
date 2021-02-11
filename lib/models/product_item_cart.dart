import 'package:flutter/foundation.dart';
import 'package:estructura_practica_1/models/product_repository.dart';

class ProductItemCart {
  String productTitle;
  int productAmount;
  double productPrice;
  final ProductType typeOfProduct;
  String productImage;
  String productDesc;
  bool productLiked;

  ProductItemCart({
    this.typeOfProduct,
    @required this.productTitle,
    @required this.productAmount,
    @required this.productPrice,
    @required this.productImage,
    @required this.productDesc,
    @required this.productLiked
  });
}
