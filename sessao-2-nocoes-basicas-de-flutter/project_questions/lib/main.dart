import 'package:flutter/material.dart';
import 'package:project_questions/quiz.dart';
import 'package:project_questions/result.dart';

void main() => runApp(const QuestionApp());

class _QuestionAppState extends State<QuestionApp> {
  var _selectedAwnser = 0;
  final List<Map<String, Object>> _questions = const [
    {
      'text': 'Qual a sua cor favorita?',
      'awnser': ['Preto', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      'text': 'Qual o seu animal favorito?',
      'awnser': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
    },
    {
      'text': 'Qual seu instrutor favorito?',
      'awnser': ['Maria', 'João', 'Leo', 'Pedro'],
    }
  ];

  bool get hasSelectedQuestion {
    return _selectedAwnser < _questions.length;
  }

  void _awnser() {
    if (hasSelectedQuestion) {
      setState(() {
        _selectedAwnser += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Questions')
          ),
        ),
        body: hasSelectedQuestion ? Quiz(
          questions: _questions,
          selectedAwnser: _selectedAwnser,
          toRespond: _awnser,
        ) : const Result(text: 'Congratulations!!!')
      )
    );
  }
}

class QuestionApp extends StatefulWidget {
  const QuestionApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuestionAppState createState() => _QuestionAppState();
}