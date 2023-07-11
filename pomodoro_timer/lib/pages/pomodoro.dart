import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro_timer/components/entry_time.dart';
import 'package:pomodoro_timer/components/timer.dart';
import 'package:pomodoro_timer/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Timer(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Observer(builder: (_) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  EntryTime(
                    value: store.workTime,
                    title: 'Trabalho',
                    inc: store.started && store.isWorking()
                        ? null
                        : store.incrementWorkTime,
                    dec: store.started && store.isWorking()
                        ? null
                        : store.decreaseWorkTime,
                  ),
                  EntryTime(
                    value: store.restTime,
                    title: 'Descanso',
                    inc: store.started && store.isResting() ? null : store.incrementRestTime,
                    dec: store.started && store.isResting() ? null : store.decreaseRestTime,
                  )
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
