import 'package:flutter/material.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:shop/pages/products_overview_page.dart';
import 'package:shop/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Shop',
      theme: ThemeData(
        fontFamily: 'Lato',
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.deepOrange,
        )
        
      ),
      home: ProductsOverviewPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.PRODUCT_DETAIL:(ctx) => const ProductDetailPage(),
      },
    );
  }
}