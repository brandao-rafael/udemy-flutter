import 'package:flutter/material.dart';
import 'package:project_questions/awnser.dart';
import 'package:project_questions/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedAwnser;
  final void Function() toRespond;

  const Quiz({
    required this.questions,
    required this.selectedAwnser,
    required this.toRespond,
    super.key,
    });

  bool get hasSelectedQuestion {
    return selectedAwnser < questions.length;
  }

  @override
  Widget build(BuildContext context) {
        List<String> awnsers = hasSelectedQuestion
      ? questions[selectedAwnser]['awnser'] as List<String>
      : [];
    return Column(children: [
      Question(questions[selectedAwnser]['text'].toString()),
      ...awnsers.map((text) => Awnser(text, toRespond)).toList(),
    ]);
  }
}
