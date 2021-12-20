// ignore_for_file: must_be_immutable

import 'package:ecom/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<Product> products;
   const Cart({this.products = const <Product>[]});
  
  double get subTotal => products.fold<double>(0, (prev, c) => prev + c.price );

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
  List<Object?> get props => [products];

  Map productQuantity(products){
    var quantity = {};
    products.forEach((product) {
      if(!quantity.containsKey(product)){
        quantity[product] = 1;
      }else{
        quantity[product] += 1;
      }
    });

    return quantity;
  }
}
