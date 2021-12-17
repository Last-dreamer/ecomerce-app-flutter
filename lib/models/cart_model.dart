// ignore_for_file: must_be_immutable

import 'package:ecom/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  Cart() {}

  double get subTotal => products.fold(0, (prev, c) => prev + c.price);

  double freeDeliveryFee(subTotal){
    if(subTotal >= 30.0){
      return 0.0;
    }else{
      return 10.0;
    }
  }


  String freeDelivery(subTotal){
    if(subTotal >= 30.0){
      return "You have free delivery";
    }else{
      var missing  = subTotal - 30;
      return "Add \$${missing} for FREE Delivery";
    }
  }

  double total(subTotal, freeDelivery){
    return subTotal + freeDelivery;
  }
  String get subTotalPrice => subTotal.toStringAsFixed(2);
  String get freeDeliveryFeeString => freeDeliveryFee(subTotal).toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subTotal);
  String get totalString => total(subTotal, freeDeliveryFee(subTotal)).toStringAsFixed(2);

  @override
  List<Product> products = [
    const Product(
        name: 'bags',
        category: 'bags',
        imageUrl:
            "https://images.unsplash.com/photo-1559056199-641a0ac8b55e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
        price: 120,
        isRecommended: true,
        isPopular: false),
    const Product(
        name: 'pepsi',
        category: 'pepsi',
        imageUrl:
            "https://images.unsplash.com/photo-1553456558-aff63285bdd1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
        price: 320,
        isRecommended: true,
        isPopular: false),
    const Product(
        name: 'bags3',
        category: 'bags',
        imageUrl:
            "https://images.unsplash.com/photo-1559056199-641a0ac8b55e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
        price: 20,
        isRecommended: true,
        isPopular: false),
    const Product(
        name: 'bags3',
        category: 'bags',
        imageUrl:
        "https://images.unsplash.com/photo-1559056199-641a0ac8b55e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
        price: 20,
        isRecommended: true,
        isPopular: false),
  ];

  @override
  List<Object?> get props => throw UnimplementedError();
}
