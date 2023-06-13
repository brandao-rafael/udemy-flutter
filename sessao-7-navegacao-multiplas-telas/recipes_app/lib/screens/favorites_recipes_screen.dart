import 'package:flutter/material.dart';
import 'package:recipes_app/components/meal_item.dart';
import 'package:recipes_app/models/meal.dart';

class FavoriteRecipesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoriteRecipesScreen(this.favoriteMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty) {
      return const Center(
        child: Text('nenhuma refeição foi marcada como favorita'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (_, i) => MealItem(favoriteMeals[i]),
      );
    }

  }
}