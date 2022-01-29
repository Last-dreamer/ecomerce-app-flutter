import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecom/blocs/cart/cart_bloc.dart';
import 'package:ecom/models/cart_model.dart';
import 'package:ecom/models/checkout_model.dart';
import 'package:ecom/models/product_model.dart';
import 'package:ecom/repositories/checkout/checkout_repository.dart';
import 'package:equatable/equatable.dart';

part 'checkout_event.dart';

part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckoutRepository _checkoutRepository;

  StreamSubscription? _cartSubscription;
  StreamSubscription? _checkoutSubscription;

  CheckoutBloc(
      {required CartBloc cartBloc,
      required CheckoutRepository checkoutRepository})
      : _cartBloc = cartBloc,
        _checkoutRepository = checkoutRepository,
        super(
          cartBloc.state is CartLoaded
            ? CheckoutLoaded(
                product: (cartBloc.state as CartLoaded).cart.products,
                subTotal: (cartBloc.state as CartLoaded).cart.subTotalPrice,
                deliveryFee:
                    (cartBloc.state as CartLoaded).cart.freeDeliveryFeeString,
                total: (cartBloc.state as CartLoaded).cart.totalString)
            : CheckoutLoading()) {

    on<UpdateCheckout>(_UpdateCheckout);
    on<ConfirmCheckout>(_ConfirmCheckout);

    _cartSubscription = cartBloc.stream.listen((state) {
      if (state is CartLoaded) {
        add(UpdateCheckout(cart: state.cart));
      }
    });
  }

  _UpdateCheckout(event, Emitter<CheckoutState> emit){
    var state =  this.state;
    if (state is CheckoutLoaded) {
      emit(CheckoutLoaded(
          email: event.email ?? state.email,
          fullName: event.fullName ?? state.fullName,
          product: event.cart?.products ?? state.product,
          deliveryFee: event.cart?.freeDeliveryFeeString ?? state.deliveryFee,
          subTotal: event.cart?.subTotalPrice ?? state.subTotal,
          total: event.cart?.totalString ?? state.total,
          address: event.address ?? state.address,
          city: event.city ?? state.city,
          country: event.country ?? state.country,
          zipCode: event.zipCode ?? state.zipCode));
    }
  }


  _ConfirmCheckout(event, Emitter<CheckoutState> emit) async{
    var state = this.state;
    _checkoutSubscription?.cancel();
    if (state is CheckoutLoaded) {
      try {
        await _checkoutRepository.addCheckout(event.checkout);
        emit(CheckoutLoading());
      } catch (_) {}
    }
  }


}
