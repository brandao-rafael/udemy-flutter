import 'package:flutter/material.dart';
import 'package:my_locations/pages/place_form_page.dart';
import 'package:my_locations/pages/places_list_page.dart';
import 'package:my_locations/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Great Places',
      theme: ThemeData(
        iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
            iconColor: MaterialStatePropertyAll(Colors.white)
          )
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.deepPurple[50], fontSize: 25),
          color: Colors.deepPurple,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.deepPurple)
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          background: Colors.deepPurple[50],
          primary: Colors.deepPurple,
        ),
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const PlacesListPage(),
      routes: {
        AppRoutes.PLACE_FORM: (ctx) => const PlaceFormPage(),
      },
    );
  }
}
