import 'package:flutter/material.dart';
import 'package:recipes_app/models/settings.dart';
import 'package:recipes_app/screens/categories_meals_screen.dart';
import 'package:recipes_app/screens/meal_detail_screen.dart';
import 'package:recipes_app/screens/settings_screen.dart';
import 'package:recipes_app/screens/tabs_screen.dart';
import 'package:recipes_app/models/meal.dart';
import 'data/dummy_data.dart';
import 'utils/app_routes.dart';
 
void main() => runApp(const MyApp());
 
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _filterMeals (Settings settings) {
    setState(() {
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filtervegetarian = settings.isVegetarian && !meal.isGlutenFree;

        return !filterGluten && !filterLactose && !filterVegan && !filtervegetarian;
      }).toList();
    });
  }

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
          color: Colors.black,
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
        AppRoutes.HOME: (_) => const TabsScreen(),
        AppRoutes.CATEGORY_MEALS: (_) => CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (_) => const MealDetailScreen(),
        AppRoutes.SETTINGS: (_) => SettingsScreen(_filterMeals),
      },
    );
  }
}
