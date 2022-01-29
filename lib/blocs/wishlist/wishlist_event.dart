part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class LoadWishList extends WishlistEvent {}

class AddProductToWishList extends WishlistEvent {
  final Product product;

  const AddProductToWishList(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveProductFromWistList extends WishlistEvent {
  final Product product;

  const RemoveProductFromWistList(this.product);

  @override
  List<Object> get props => [product];
}
