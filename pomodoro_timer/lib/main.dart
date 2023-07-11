import 'package:flutter/material.dart';
import 'package:pomodoro_timer/pages/pomodoro.dart';
import 'package:pomodoro_timer/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PomodoroStore>(
          create: (context) => PomodoroStore(),
        ),
      ],
      child: MaterialApp(
        title: 'Pomodoro',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          // useMaterial3: true,
        ),
        home: const Pomodoro(),
      ),
    );
  }
}
