
import 'package:ecom/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  Cart(){}

  @override
  List<Object?> get props => [
    const Product(
        name: 'pepsi',
        category: 'pepsi',
        imageUrl:
        "https://images.unsplash.com/photo-1553456558-aff63285bdd1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
        price: '\$20',
        isRecommended: true,
        isPopular: false),

    const Product(
        name: 'bags',
        category: 'bags',
        imageUrl:
        "https://images.unsplash.com/photo-1559056199-641a0ac8b55e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
        price: '\$20',
        isRecommended: true,
        isPopular: false),

    const Product(
        name: 'pepsi',
        category: 'pepsi',
        imageUrl:
        "https://images.unsplash.com/photo-1553456558-aff63285bdd1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
        price: '\$20',
        isRecommended: true,
        isPopular: false),
    const Product(
        name: 'bags3',
        category: 'bags',
        imageUrl:
        "https://images.unsplash.com/photo-1559056199-641a0ac8b55e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
        price: '\$20',
        isRecommended: true,
        isPopular: false),

  ];
}