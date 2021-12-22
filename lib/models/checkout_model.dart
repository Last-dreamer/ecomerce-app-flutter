import 'package:ecom/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Checkout extends Equatable {
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

  const Checkout(
      {required this.fullName,
      required this.email,
      required this.address,
      required this.city,
      required this.country,
      required this.zipCode,
      required this.product,
      required this.subTotal,
      required this.deliveryFee,
      required this.total});

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
        total
      ];


  Map<String, Object> toDoc(){
    Map customerAddress = {};
    customerAddress['address'] = address!;
    customerAddress['city'] = city!;
    customerAddress['country'] = country!;
    customerAddress['zipCode'] = zipCode!;

    return {
      "CustomerAddress": customerAddress,
      "CustomerName": fullName!,
      "CustomerEmail": email!,
      "products": product!.map((e) => e.name).toList(),
      "subTotal": subTotal!,
      "DeliveryFee": deliveryFee!,
      "total": total!,
    };
  }
}
