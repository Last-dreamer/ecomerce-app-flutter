import 'package:ecom/blocs/cart/cart_bloc.dart';
import 'package:ecom/models/cart_model.dart';
import 'package:ecom/models/product_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  const CartProductCard({Key? key, required this.product, required this.quantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            width: 100,
            height: 90,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.black)),
                const SizedBox(height: 5),
                Text("\$${product.price}",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.black)),
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Row(
            children: [
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      context.read<CartBloc>().add(RemovedCart(product));
                      var snackbar =
                      const SnackBar(content: Text("Removed from Cart"));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    },
                  );
                },
              ),
              Text("${quantity}",
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: Colors.black)),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      context.read<CartBloc>().add(AddCart(product));
                      var snackbar =
                      const SnackBar(content: Text("Added to Cart"));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
