// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int points;
  
  const Result(this.points, {super.key});

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
    return Center(
      child: Text(
        resultPhrase,
        style: const TextStyle(fontSize: 28),
      ),
    );
  }
}
