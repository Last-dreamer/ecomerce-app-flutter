import 'package:ecom/models/product_model.dart';
import 'package:ecom/models/wishlist_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()){
    on<LoadWishList>(_LoadWishList);
    on<AddProductToWishList>(_AddProductToWishList);
    on<RemoveProductFromWistList>(_RemoveProductFromWistList);
  }


  _LoadWishList(event, Emitter<WishlistState> emit) async {
     emit(WishlistLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(const WishlistLoaded());
    } catch (_) {}
  }

  _AddProductToWishList(event, Emitter<WishlistState> emit) async {
    var state  = this.state;
    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
            wishList: WishList(
                products: List.from(state.wishList.products)
                  ..add(event.product))));
      } catch (_) {}
    }
  }




  _RemoveProductFromWistList(event, Emitter<WishlistState> emit) async {

    var state =  this.state;
    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
            wishList: WishList(
                products: List.from(state.wishList.products)
                  ..remove(event.product))));
      } catch (_) {}

  }

}


}
