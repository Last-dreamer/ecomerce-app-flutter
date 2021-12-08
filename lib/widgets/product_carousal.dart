
import 'package:ecom/models/product_model.dart';
import 'package:ecom/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductCarousal extends StatelessWidget {
  final List<Product> productList;
  const ProductCarousal({
    Key? key,
    required this.productList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ProductCard(
              product: productList[index],
            ),
          );
        },
      ),
    );
  }
}
