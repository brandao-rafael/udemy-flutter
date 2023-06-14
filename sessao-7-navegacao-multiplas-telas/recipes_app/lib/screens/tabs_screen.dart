import 'package:flutter/material.dart';
import 'package:recipes_app/components/main_drawer.dart';
import 'package:recipes_app/models/meal.dart';
import 'package:recipes_app/screens/categories_screen.dart';
import 'package:recipes_app/screens/favorites_recipes_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  late List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
    {
      'title': 'Lista de Categorias',
      'screen': const CategoriesScreen(),
    },
    {
      'title': 'Meus Favoritos',
      'screen': FavoriteRecipesScreen(widget.favoriteMeals),
    }
  ];

  }

  _selectScreen(int i) {
    setState(() {
      _selectedScreenIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(_screens[_selectedScreenIndex]['title'] as String)),
      ),
      drawer: const MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          )
        ],
      ),
    );
  }
}
