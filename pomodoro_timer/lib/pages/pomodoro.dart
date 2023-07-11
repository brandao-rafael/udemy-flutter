import 'package:flutter/material.dart';
import 'package:pomodoro_timer/components/entry_time.dart';
import 'package:pomodoro_timer/components/timer.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Timer(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          ),
        ],
      ),
    );
  }
}
