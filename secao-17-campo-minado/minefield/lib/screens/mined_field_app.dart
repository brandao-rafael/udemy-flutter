import 'package:flutter/material.dart';
import 'package:minefield/components/board_widget.dart';
import 'package:minefield/components/result_widget.dart';
import 'package:minefield/models/board.dart';
import 'package:minefield/models/explosion_exception.dart';
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
    setState(() {
      _win = null;
      _board.restart();
    });
  }

  void _open(Field field) {
    if(_win != null) return;
    
    setState(() {
      try {
        field.open();
        if(_board.solved) {
          _win = true;
        }
      } on ExplosionException {
        _win = false;
        _board.showBombs();
      }
    });
  }

  void _changeAppointement(Field field) {
    if(_win != null) return;
    setState(() {
      field.changeAppointment();
      if(_board.solved) {
        _win = true;
      }
    });
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
