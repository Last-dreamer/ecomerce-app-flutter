import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/models/catergory_model.dart';
import 'package:ecom/models/product_model.dart';
import 'package:ecom/widgets/custom_app_bar.dart';
import 'package:ecom/widgets/custom_nav_bar.dart';
import 'package:ecom/widgets/hero_carousal_card.dart';

import 'package:ecom/widgets/product_carousal.dart';
import 'package:ecom/widgets/section_title.dart';
import 'package:flutter/material.dart';

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
          CarouselSlider(
            options: CarouselOptions(
                aspectRatio: 1.8,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height),
            items: CategoryModel.catergoryList
                .map((e) => HeroCarousal(categoryModel: e))
                .toList(),
          ),
          const SectionTitle(
            title: "Recommended",
          ),
          ProductCarousal(
            productList:
                Product.products.where((e) => e.isRecommended == true).toList(),
          ),
          const SectionTitle(title: "Popular"),
          ProductCarousal(
              productList:
                  Product.products.where((e) => e.isPopular == true).toList()),
        ],
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
