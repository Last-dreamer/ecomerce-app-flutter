import 'package:ecom/blocs/cart/cart_bloc.dart';
import 'package:ecom/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool wishList;

  const ProductCard(
      {Key? key,
      required this.product,
      this.widthFactor = 2.5,
      this.leftPosition = 0,
      this.wishList = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/product", arguments: product);
      },
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / widthFactor,
            height: 150,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              top: 60,
              left: leftPosition,
              height: 80,
              child: Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 50,
                  color: Colors.black.withAlpha(50))),
          Positioned(
            top: 85,
            left: leftPosition,
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: 60,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: product.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          Text(
                            product.price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if(state is CartLoading){
                          return const  CircularProgressIndicator();
                        }
                        if(state is CartLoaded){
                          return Center(
                            child: IconButton(
                                onPressed: () {
                                  context.read<CartBloc>().add(CartProductAdded(product));
                                  var snackbar = const  SnackBar(content: Text("Added to Cart"));
                                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                },
                                icon: const Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                )),
                          );
                        }else {
                          return const Text("Some Error");
                        }
                      },
                    ),
                    wishList
                        ? Center(
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                )),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
