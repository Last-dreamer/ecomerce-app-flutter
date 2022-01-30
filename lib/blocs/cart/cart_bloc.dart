import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecom/models/cart_model.dart';
import 'package:ecom/models/product_model.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<LoadCart>(_onLoadCart);
    on<AddCart>(_onAddCart);
    on<RemovedCart>(_onRemovedCart);
  }

  _onLoadCart(event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(CartLoaded());
    } catch (e) {}
  }

  _onAddCart(event, Emitter<CartState> emit) {
    var state = this.state;
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)..add(event.product))));
      } catch (e) {}
    }
  }

  _onRemovedCart(event, Emitter<CartState> emit) {
    var state = this.state;
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)
                  ..remove(event.product))));
      } catch (e) {}
    }
  }
}
