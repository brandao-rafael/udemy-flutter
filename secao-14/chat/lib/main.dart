import 'package:chat/pages/auth_or_app_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              iconColor:
                  MaterialStateColor.resolveWith((states) => Colors.white),
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.blue),
              foregroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.white),
              elevation: MaterialStateProperty.all(5)),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          outlineVariant: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const AuthOrAppPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
