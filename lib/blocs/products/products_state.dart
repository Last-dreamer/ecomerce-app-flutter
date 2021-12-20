part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}



class ProductLoading extends ProductsState {
}

class ProductLoaded extends ProductsState {
  final List<Product> product;
  const  ProductLoaded({this.product = const <Product>[]});
  @override
  List<Object> get props => [product];
}
