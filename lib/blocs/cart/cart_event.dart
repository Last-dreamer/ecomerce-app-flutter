part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class LoadCart extends CartEvent {
  @override
  List<Object?> get props => [];
}

class AddCart extends CartEvent {
  final Product product;

  const AddCart(this.product);
  @override
  List<Object?> get props => [product];
}


class RemovedCart extends CartEvent {
  final Product product;
  const RemovedCart(this.product);
  @override
  List<Object?> get props => [product];
}