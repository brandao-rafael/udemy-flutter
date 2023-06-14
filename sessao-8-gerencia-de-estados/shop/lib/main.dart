import 'package:flutter/material.dart';
import 'package:shop/pages/products_overview_page.dart';

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
        primarySwatch: Colors.purple,
        fontFamily: 'Lato',
        colorScheme: theme.colorScheme.copyWith(
          secondary: Colors.deepOrange,
        )
        
      ),
      home: ProductsOverviewPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}