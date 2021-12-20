


 
import 'package:ecom/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderSummery extends StatelessWidget {
  const OrderSummery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<CartBloc, CartState>(
  builder: (context, state) {
     if(state is CartLoading){
       return const Center(child: CircularProgressIndicator(),);
     }
     if(state is CartLoaded){
       return Column(
         children: [
           Padding(
             padding: const EdgeInsets.symmetric(
                 vertical: 10, horizontal: 20),
             child: Column(
               children: [
                 const Divider(
                   thickness: 2,
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("SUBTOTAL",
                         style: Theme.of(context)
                             .textTheme
                             .headline5!
                             .copyWith(color: Colors.black)),
                     Text("\$ ${state.cart.totalString  }",
                         style: Theme.of(context)
                             .textTheme
                             .headline5!
                             .copyWith(color: Colors.black)),
                   ],
                 ),
                 const SizedBox(height: 10),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("Delivery Fee",
                         style: Theme.of(context)
                             .textTheme
                             .headline5!
                             .copyWith(color: Colors.black)),
                     Text("\$${state.cart.freeDeliveryFeeString}",
                         style: Theme.of(context)
                             .textTheme
                             .headline5!
                             .copyWith(color: Colors.black)),
                   ],
                 ),
               ],
             ),
           ),
           Stack(
             children: [
               Container(
                 width: MediaQuery.of(context).size.width,
                 height: 60,
                 decoration: BoxDecoration(
                   color: Colors.black.withAlpha(50),
                 ),
               ),
               Container(
                 width: MediaQuery.of(context).size.width,
                 margin: const EdgeInsets.all(8.0),
                 height: 45,
                 decoration: const BoxDecoration(
                   color: Colors.black,
                 ),
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("TOTAL",
                           style: Theme.of(context)
                               .textTheme
                               .headline3!
                               .copyWith(color: Colors.white)),
                       Text("\$${state.cart.totalString}",
                           style: Theme.of(context)
                               .textTheme
                               .headline3!
                               .copyWith(color: Colors.white)),
                     ],
                   ),
                 ),
               )
             ],
           ),
         ],
       );
     }else{
       return const Text("Error");
     }
  },
);
  }
}
