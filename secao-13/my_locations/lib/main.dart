import 'package:flutter/material.dart';
import 'package:my_locations/pages/place_form_page.dart';
import 'package:my_locations/pages/places_list_page.dart';
import 'package:my_locations/providers/great_places.dart';
import 'package:my_locations/utils/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData();
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
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
          colorScheme: theme.colorScheme.copyWith(
            background: Colors.deepPurple[50],
            primary: Colors.deepPurple,
            secondary: Colors.amber,
          ),
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: Colors.amber
          ),
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const PlacesListPage(),
        routes: {
          AppRoutes.PLACE_FORM: (ctx) => const PlaceFormPage(),
        },
      ),
    );
  }
}
