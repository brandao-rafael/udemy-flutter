import 'package:flutter/material.dart';
import 'package:minefield/components/result_widget.dart';

class MinedFieldApp extends StatelessWidget {
  const MinedFieldApp({super.key});

  _restart() {
    print('restart');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(onRestart: _restart, win: null),
        body: Container(
          child: const Text('tabuleiro'),
        ),
      ),
    );
  }
}