part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();
  @override
  List<Object?> get props => [];
}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final List<Product>? product;
  final String? subTotal;
  final String? deliveryFee;
  final String? total;
  final Checkout checkout;

  CheckoutLoaded(
      {  this.fullName,
        this.email,
        this.address,
        this.city,
        this.country,
        this.zipCode,
        this.product,
        this.subTotal,
        this.deliveryFee,
        this.total})
      : checkout = Checkout(
            fullName: fullName,
            email: email,
            address: address,
            city: city,
            country: country,
            zipCode: zipCode,
            product: product,
            subTotal: subTotal,
            deliveryFee: deliveryFee,
            total: total);

  @override
  List<Object?> get props => [
    fullName,
    email,
    address,
    city,
    country,
    zipCode,
    product,
    subTotal,
    deliveryFee,
    total];
}
