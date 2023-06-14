import 'package:flutter/material.dart';
import 'package:recipes_app/components/meal_item.dart';
import 'package:recipes_app/models/category.dart';
import 'package:recipes_app/models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {

  final List<Meal> meals;

  const CategoriesMealsScreen(this.meals, {super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    final categoryMeals = meals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(category.title)),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, i) {
          return MealItem(categoryMeals[i]);
        },
      ),
    );
  }
}
