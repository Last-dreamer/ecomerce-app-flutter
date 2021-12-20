import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/models/catergory_model.dart';
import 'package:ecom/models/product_model.dart';
import 'package:ecom/widgets/custom_app_bar.dart';
import 'package:ecom/widgets/custom_nav_bar.dart';
import 'package:ecom/widgets/hero_carousal_card.dart';

import 'package:ecom/widgets/product_carousal.dart';
import 'package:ecom/widgets/section_title.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String routeName = "/splash";

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (context) => const SplashScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 2),
        () =>
            Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false));
    return Scaffold(
        body: Center(
      child: Image.asset("assets/dreamer.png"),
    ));
  }
}
