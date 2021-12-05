import 'package:ecom/config/app_router.dart';
import 'package:ecom/config/theme.dart';
import 'package:ecom/screens/home/home_screen.dart';
import 'package:ecom/widgets/custom_app_bar.dart';
import 'package:ecom/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      home: HomeScreen(),
    );
  }
}
