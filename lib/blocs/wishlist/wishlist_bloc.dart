import 'package:ecom/models/product_model.dart';
import 'package:ecom/models/wishlist_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading());

  @override
  Stream<WishlistState> mapEventToState(WishlistEvent event) async* {
    if (event is StartWishList) {
      yield* _mapStartWishListToState();
    } else if (event is AddWishListProduct) {
      yield* _mapAddToWishListToState(event, state);
    } else if (event is RemoveWishListProduct) {
      yield* _mapRemoveFromWishListToState(event, state);
    }
  }

  Stream<WishlistState> _mapStartWishListToState() async* {
    yield WishlistLoading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      yield const WishlistLoaded();
    } catch (_) {}
  }

  Stream<WishlistState> _mapAddToWishListToState(
      AddWishListProduct event, WishlistState state) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
            wishList: WishList(
                products: List.from(state.wishList.products)
                  ..add(event.product)));
      } catch (_) {}
    }
  }

  Stream<WishlistState> _mapRemoveFromWishListToState(
      RemoveWishListProduct event, WishlistState state) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
            wishList: WishList(
                products: List.from(state.wishList.products)
                  ..remove(event.product)));
      } catch (_) {}
    }
  }
}
