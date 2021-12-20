part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();
}

class LoadProduct  extends ProductsEvent {
  @override
  List<Object?> get props => [];
}

class UpdateProduct extends ProductsEvent {
  final List<Product> product;
  const UpdateProduct(this.product);
  @override
  List<Object?> get props => [product];
}

