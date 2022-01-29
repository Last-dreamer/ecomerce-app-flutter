import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/models/product_model.dart';
import 'package:ecom/repositories/product/base_product_repository.dart';
import 'dart:developer' as dev;


class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;

  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProduct() {
    return _firebaseFirestore
        .collection("products")
        .snapshots()
        .map((snap) {
         dev.log("checking .... data ${snap.docs.map((e) => e.data())}");
         return  snap.docs.map((e) {    return  Product.fromFactory(e.data());}).toList(); });
  }
}
