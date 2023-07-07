import 'package:flutter/material.dart';
import 'package:minefield/components/board_widget.dart';
import 'package:minefield/components/result_widget.dart';
import 'package:minefield/models/board.dart';
import 'package:minefield/models/field.dart';

class MinedFieldApp extends StatefulWidget {
  const MinedFieldApp({super.key});

  @override
  State<MinedFieldApp> createState() => _MinedFieldAppState();
}

class _MinedFieldAppState extends State<MinedFieldApp> {
  bool? _win;
  final Board _board = Board(
    lines: 12,
    columns: 12,
    amountOfBombs: 3,
  );

  void _restart() {
    print('restart');
  }

  void _open(Field field) {
    print('open');
  }

  void _changeAppointement(Field field) {
    print('change appointement');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          win: _win,
          onRestart: _restart,
        ),
        body: BoardWidget(
          board: _board,
          onOpen: _open,
          onChangeAppointement: _changeAppointement,
        ),
      ),
    );
  }
}
