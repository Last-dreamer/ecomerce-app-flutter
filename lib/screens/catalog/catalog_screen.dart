import 'package:ecom/models/catergory_model.dart';
import 'package:ecom/models/product_model.dart';
import 'package:ecom/screens/home/home_screen.dart';
import 'package:ecom/widgets/custom_app_bar.dart';
import 'package:ecom/widgets/custom_nav_bar.dart';
import 'package:ecom/widgets/product_card.dart';
import 'package:ecom/widgets/product_carousal.dart';

import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key, required this.category}) : super(key: key);
  static const String routeName = '/catalog';

  static Route route({required CategoryModel category}) => MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) =>  CatalogScreen(category: category),
      );
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProduct =  Product.products.where((e) => e.category == category.name).toList();
    return Scaffold(
      appBar: CustomAppBar(
        title: category.name,
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.15),
          itemCount: categoryProduct.length,
          itemBuilder: (context, index){
            return ProductCard(product: categoryProduct[index], widthFactor: 2.6,);
          })
    );
  }
}
