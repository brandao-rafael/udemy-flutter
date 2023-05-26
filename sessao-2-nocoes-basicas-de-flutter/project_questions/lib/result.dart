// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int points;
  final void Function() toRestartQuiz;
  
  const Result(this.points, this.toRestartQuiz, {super.key});

  String get resultPhrase {
    if(points < 8) {
      return 'Parabéns!';
    } else if (points < 12) {
      return 'Você é bom';
    } else if (points < 16) {
      return 'Impressionante';
    } else {
      return 'Nível Jedi!!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            resultPhrase,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: toRestartQuiz,
          child: const Text(
            'Reiniciar?', 
            style: TextStyle(fontSize: 18, color: Colors.blue)
          ),

        )
      ],
    );
  }
}
