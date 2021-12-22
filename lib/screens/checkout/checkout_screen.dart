import 'package:ecom/blocs/checkout/checkout_bloc.dart';
import 'package:ecom/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecom/models/product_model.dart';
import 'package:ecom/widgets/custom_app_bar.dart';
import 'package:ecom/widgets/custom_nav_bar.dart';
import 'package:ecom/widgets/order_summery.dart';
import 'package:ecom/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);
  static const String routeName = '/checkout';

  static Route route() => MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CheckOutScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(
          title: 'CheckOut',
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlocBuilder<CheckoutBloc, CheckoutState>(
                  builder: (context, state) {
                   if(state is CheckoutLoading){
                     return const Center(child: CircularProgressIndicator(),);
                   }
                   if(state is CheckoutLoaded){
                     return ElevatedButton(
                         style: ElevatedButton.styleFrom(primary: Colors.white),
                         onPressed: () {
                           context.read<CheckoutBloc>().add(ConfirmCheckout(checkout: state.checkout));
                           Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
                         },
                         child: Text(
                           "ORDER NOW",
                           style: Theme.of(context)
                               .textTheme
                               .headline2!
                               .copyWith(color: Colors.black),
                         ));
                   }else {
                     return const Text("something went wrong...");
                   }
                  },
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CheckoutLoaded) {
                return
                  // Text("hello");
                  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CUSTOMER INFORMATION",
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: Colors.black),
                    ),
                    _buildTextFormField((v) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(email: v));
                    }, context, "Email"),
                    _buildTextFormField((v) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(fullName: v));
                    }, context, "Full Name"),
                    Text(
                      "DELIVERY INFORMATION",
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: Colors.black),
                    ),
                    _buildTextFormField((v) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(address: v));
                    }, context, "Address"),
                    _buildTextFormField((v) {
                      context.read<CheckoutBloc>().add(UpdateCheckout(city: v));
                    }, context, "City"),
                    _buildTextFormField((v) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(country: v));
                    }, context, "Country"),
                    _buildTextFormField((v) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(zipCode: v));
                    }, context, "Zip Code"),
                    Text(
                      "ORDER SUMMERY",
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: Colors.black),
                    ),
                    const Center(child: OrderSummery()),
                  ],
                );
              } else {
                return const Text("something went wrong");
              }
            },
          ),
        ));
  }

  Padding _buildTextFormField(
      Function(String?) onChange, BuildContext context, String lableText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              lableText,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.black),
            ),
          ),
          Expanded(
              child: TextFormField(
            onChanged: onChange,
            decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(left: 10),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.lightBlueAccent,
                ))),
          )),
        ],
      ),
    );
  }
}
