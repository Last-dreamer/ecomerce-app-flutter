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
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController addressController = TextEditingController();

    TextEditingController cityController = TextEditingController();
    TextEditingController countryController = TextEditingController();
    TextEditingController zipCodeController = TextEditingController();

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
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () {},
                    child: Text(
                      "ORDER NOW",
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: Colors.black),
                    )),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
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
              _buildTextFormField(emailController, context, "Email"),
              _buildTextFormField(nameController, context, "Full Name"),
              Text(
                "DELIVERY INFORMATION",
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Colors.black),
              ),
              _buildTextFormField(addressController, context, "Address"),
              _buildTextFormField(cityController, context, "City"),
              _buildTextFormField(countryController, context, "Country"),
              _buildTextFormField(zipCodeController, context, "Zip Code"),
              Text(
                "ORDER SUMMERY",
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Colors.black),
              ),
                Center(child: OrderSummery()),
            ],
          ),
        ));
  }

  Padding _buildTextFormField(TextEditingController controller,
      BuildContext context, String lableText) {
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
            controller: controller,
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
