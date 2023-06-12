import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {

  final Category category;

  const CategoriesMealsScreen(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(category.title)),
      ),
      body: Center(
        child: Text("Receits por categoria ${category.id}"),
      ),
    );
  }
}
