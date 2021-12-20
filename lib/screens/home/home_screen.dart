import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/blocs/category/category_bloc.dart';
import 'package:ecom/blocs/products/products_bloc.dart';
import 'package:ecom/models/catergory_model.dart';
import 'package:ecom/models/product_model.dart';
import 'package:ecom/widgets/custom_app_bar.dart';
import 'package:ecom/widgets/custom_nav_bar.dart';
import 'package:ecom/widgets/hero_carousal_card.dart';

import 'package:ecom/widgets/product_carousal.dart';
import 'package:ecom/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = "/";

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (context) => const HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Ecom Home",
      ),
      body: ListView(
        children: [
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return const CircularProgressIndicator();
              }
              if (state is CategoryLoaded) {
                return CarouselSlider(
                  options: CarouselOptions(
                      aspectRatio: 1.8,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height),
                  items: state.categoryModel
                      .map((e) => HeroCarousal(categoryModel: e))
                      .toList(),
                );
              } else {
                return const Text("something wrong with bloc");
              }
            },
          ),
          const SectionTitle(
            title: "Recommended",
          ),
          BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
             if(state is ProductLoading){
               return  const Center(child: CircularProgressIndicator());
             }
             if(state is ProductLoaded){
               return ProductCarousal(
                 productList: state.product.where((e) => e.isRecommended == true).toList()
                 // Product.products.where((e) => e.isRecommended == true).toList(),
               );
             }else{
               return const Text("Error");
             }
            },
          ),
          const SectionTitle(title: "Popular"),
          BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              if(state is ProductLoading){
                return  const Center(child: CircularProgressIndicator());
              }
              if(state is ProductLoaded){
                return ProductCarousal(
                    productList: state.product.where((e) => e.isPopular == true).toList()
                  // Product.products.where((e) => e.isRecommended == true).toList(),
                );
              }else{
                return const Text("Error");
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
