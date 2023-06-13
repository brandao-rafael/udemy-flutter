import 'package:flutter/material.dart';
import 'package:recipes_app/screens/categories_meals_screen.dart';
import 'package:recipes_app/screens/categories_screen.dart';
import 'package:recipes_app/screens/meal_detail_screen.dart';
import 'utils/app_routes.dart';
 
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      canvasColor: const Color.fromRGBO(255, 254, 229, 1),
    );
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
      textTheme: theme.textTheme.copyWith(
        titleLarge: const TextStyle(
          fontFamily: 'Raleway',
          fontSize: 20,
        ),
        labelLarge: const TextStyle(
          color: Colors.black,
          fontFamily: 'RobotoCondensed',
          fontSize: 20
        )),
      ),
      routes: {
        AppRoutes.HOME: (_) => const CategoriesScreen(),
        AppRoutes.CATEGORY_MEALS: (_) => const CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (_) => const MealDetailScreen(),
      },
    );
  }
}
