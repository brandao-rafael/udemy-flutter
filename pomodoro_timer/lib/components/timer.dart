import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro_timer/components/timer_button.dart';
import 'package:pomodoro_timer/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Timer extends StatelessWidget {
  const Timer({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Hora de Trabalhar',
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
          const SizedBox(height: 20),
          Text(
            '${store.minutes.toString().padLeft(2, '0')}:${store.seconds.toString().padLeft(2, '0')}',
            style: const TextStyle(fontSize: 120, color: Colors.white),
          ),
          const SizedBox(height: 20),
          Observer(builder: (_) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!store.started)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TimerButton(
                      text: 'Iniciar',
                      icon: Icons.play_arrow,
                      onClick: store.start,
                    ),
                  ),
                if (store.started)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TimerButton(
                      text: 'Parar',
                      icon: Icons.stop,
                      onClick: store.stop,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TimerButton(
                    text: 'Reiniciar',
                    icon: Icons.refresh,
                    onClick: store.restart,
                  ),
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}