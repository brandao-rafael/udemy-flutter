import 'package:flutter/material.dart';

class MinedFieldApp extends StatelessWidget {
  const MinedFieldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Mined Field'),
        ),
        body: Container(
          child: const Text('tabuleiro'),
        ),
      ),
    );
  }
}