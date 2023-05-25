import 'package:flutter/material.dart';
import 'package:project_questions/awnser.dart';
import 'package:project_questions/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedAwnser;
  final void Function(int) toRespond;

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
        List<Map<String, Object>> awnsers = hasSelectedQuestion
      ? questions[selectedAwnser]['awnser'] as List<Map<String, Object>>
      : [];

    return Column(children: [
      Question(questions[selectedAwnser]['text'].toString()),
      ...awnsers.map((awn) {
        return Awnser(
          awn['text'].toString(),
          () => toRespond(int.parse(awn['points'].toString())),
        );
      }).toList()
    ]);
  }
} // text toString() int.parse(grades)
