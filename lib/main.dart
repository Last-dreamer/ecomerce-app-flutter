import 'package:ecom/blocs/cart/cart_bloc.dart';
import 'package:ecom/blocs/category/category_bloc.dart';
import 'package:ecom/blocs/products/products_bloc.dart';
import 'package:ecom/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecom/config/app_router.dart';
import 'package:ecom/config/theme.dart';
import 'package:ecom/repositories/category/category_repository.dart';
import 'package:ecom/repositories/product/product_repository.dart';
import 'package:ecom/screens/Splash/splash_screen.dart';
import 'package:ecom/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishList())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(create: (_) => CategoryBloc(
            categoryRepository: CategoryRepository())
          ..add(LoadCategories())),

        BlocProvider(create: (_) => ProductsBloc(
            productRepository: ProductRepository())
            ..add(LoadProduct())),
      ],
      child: MaterialApp(
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: "/splash",
      ),
    );
  }
}
