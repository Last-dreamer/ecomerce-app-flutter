import 'package:ecom/models/catergory_model.dart';
import 'package:ecom/screens/cart/cart_screen.dart';
import 'package:ecom/screens/catalog/catalog_screen.dart';
import 'package:ecom/screens/home/home_screen.dart';
import 'package:ecom/screens/wishlist/wishlist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/catergory_model.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case '/cart':
        return CartScreen.route();
      case '/catalog':
        return CatalogScreen.route(category: settings.arguments as CategoryModel);

      case '/wishlist':
        return WishListScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute<void>(
      settings: const RouteSettings(name: "/error"),
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      ),
    );
  }
}
