import 'package:cloud_firestore/cloud_firestore.dart';

class CartProduct {
  CartProduct(
      {required this.name,
      required this.img1,
      required this.prodPrice,
      required this.counts,
      required this.totalPrice});
  String name;
  String img1;
  int prodPrice;

  int totalPrice;
  int counts;

  // String? category;
}

List<CartProduct> listcartproduct = [];
