import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/config/theme.dart';
import 'package:ecom/models/product_model.dart';
import 'package:ecom/widgets/custom_app_bar.dart';
import 'package:ecom/widgets/custom_nav_bar.dart';
import 'package:ecom/widgets/hero_carousal_card.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key, required this.product}) : super(key: key);
  final Product product;

  static const String routeName = "/product";

  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => ProductDetail(product: product),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.share, color: Colors.white,),),
              IconButton(onPressed: (){}, icon: const Icon(Icons.favorite, color: Colors.white,),),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: (){}, child: Text("Add To Cart",
                style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.black),)),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
              options: CarouselOptions(
                  aspectRatio: 1.8,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height),
              items: [
                HeroCarousal(
                  product: product,
                ),
              ]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                Container(
                  color: Colors.black.withAlpha(50),
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width - 10,
                  height: 50,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: Colors.white),
                        ),
                        Text(product.price,
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: ExpansionTile(
              title: Text("Product Information",
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: Colors.black)),
              children: [
                ListTile(
                  title: Text(
                    "a quick brown fox jumps over the lazy dog. a quick brown fox jumps over the lazy fox",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: ExpansionTile(
              title: Text("Delivery Information",
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: Colors.black)),
              children: [
                ListTile(
                  title: Text(
                    "a quick brown fox jumps over the lazy dog. a quick brown fox jumps over the lazy fox",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
