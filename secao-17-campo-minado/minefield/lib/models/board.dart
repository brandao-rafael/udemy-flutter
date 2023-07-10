// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_function_literals_in_foreach_calls
import 'dart:math';

import 'package:minefield/models/field.dart';

class Board {
  final int lines;
  final int columns;
  final int amountOfBombs;

  final List<Field> _fields = [];

  Board({
    required this.lines,
    required this.columns,
    required this.amountOfBombs,
  }) {
    _createFields();
    _relateNeighbor();
    _shuffleMines();
  }

  void restart() {
    _fields.forEach((f) => f.restart());
    _shuffleMines();
  }

  void showBombs() {
    _fields.forEach((f) => f.showBomb());
  }
  
  void _createFields() {
    for(int l = 0; l < lines; l++) {
      for(int c = 0; c < columns; c++) {
        _fields.add(Field(column: c, line: l));
      }
    }
  }
  
  void _relateNeighbor() {
    for(var field in _fields) {
      for(var neighbor in _fields) {
        field.addNeighbor(neighbor);
      }
    }
  }
  
  void _shuffleMines() {
    int shuffled = 0;

    if(amountOfBombs > lines * columns) return;

    while(shuffled < amountOfBombs) {
      int i = Random().nextInt(_fields.length);
      
      if(!_fields[i].undermined) {
        shuffled++;
        _fields[i].putMine();
      }
    }
  }

  List<Field> get fields {
    return _fields;
  }

  bool get solved {
    return _fields.every((f) => f.solved);
  }

}
