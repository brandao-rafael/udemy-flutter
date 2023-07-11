import 'package:flutter/material.dart';
import 'package:pomodoro_timer/components/entry_time.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          EntryTime(
            value: 25,
            title: 'Trabalho',
          ),
          EntryTime(
            value: 5,
            title: 'Descanso',
          )
        ],
      ),
    );
  }
}
