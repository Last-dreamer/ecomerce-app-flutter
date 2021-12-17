import 'package:ecom/models/product_model.dart';
import 'package:equatable/equatable.dart';

class WishList extends Equatable {
  final List<Product> products;

  const WishList({this.products = const <Product>[]});
  @override
  List<Object?> get props => [products];
}
