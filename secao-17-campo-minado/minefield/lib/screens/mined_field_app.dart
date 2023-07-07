import 'package:flutter/material.dart';
import 'package:minefield/components/field_widget.dart';
import 'package:minefield/components/result_widget.dart';
import 'package:minefield/models/explosion_exception.dart';
import 'package:minefield/models/field.dart';

class MinedFieldApp extends StatelessWidget {
  const MinedFieldApp({super.key});

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
    Field neighbor1 = Field(line: 1, column: 0);
    neighbor1.putMine();
    Field neighbor2 = Field(line: 1, column: 1);
    neighbor2.putMine();
    Field field = Field(line: 0, column: 0);
    field.addNeighbor(neighbor1);
    field.addNeighbor(neighbor2);
    
    try {
      // field.putMine();
      field.changeAppointment();
    } on ExplosionException catch (e) {
      print(e);
    }

    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(onRestart: _restart, win: null),
        body: FieldWidget(
          field: field,
          onOpen: _open,
          onChangeAppointement: _changeAppointement,
        )
      ),
    );
  }
}