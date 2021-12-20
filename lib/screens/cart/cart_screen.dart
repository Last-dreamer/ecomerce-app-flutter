import 'package:ecom/blocs/cart/cart_bloc.dart';
import 'package:ecom/models/cart_model.dart';
import 'package:ecom/models/product_model.dart';
import 'package:ecom/screens/Splash/splash_screen.dart';
import 'package:ecom/screens/checkout/checkout_screen.dart';
import 'package:ecom/widgets/cart_product_card.dart';
import 'package:ecom/widgets/custom_app_bar.dart';
import 'package:ecom/widgets/custom_nav_bar.dart';
import 'package:ecom/widgets/order_summery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const String routeName = '/cart';

  static Route route() =>
      MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CartScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Cart',
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () {
                      Navigator.pushNamed(context, CheckOutScreen.routeName);
                    },
                    child: Text(
                      "GO TO CHECKOUT",
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: Colors.black),
                    )),
              ],
            ),
          ),
        ),
        body:
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if(state is CartLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is CartLoaded){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(state.cart.freeDeliveryString,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: Colors.black)),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, "/");
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  shape: const RoundedRectangleBorder(),
                                  elevation: 0,
                                ),
                                child: Text("Add more items",
                                    style:
                                    Theme.of(context).textTheme.button!.copyWith(
                                      color: Colors.white,
                                    ))),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        SingleChildScrollView(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.45,
                            child: ListView.builder(
                              itemCount: state.cart.productQuantity(state.cart.products).keys.length,
                              itemBuilder: (_, index) {
                                return CartProductCard(
                                  product:  state.cart.productQuantity(state.cart.products).keys.elementAt(index),
                                  quantity:  state.cart.productQuantity(state.cart.products).values.elementAt(index),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                   const OrderSummery(),
                  ],
                ),
              );
            }
            else {
              return const Text("Some error in bloc");
            }
          },
        )

    );
  }
}
