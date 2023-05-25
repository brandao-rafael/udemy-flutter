import 'package:flutter/material.dart';
import 'package:project_questions/quiz.dart';
import 'package:project_questions/result.dart';

void main() => runApp(const QuestionApp());

class _QuestionAppState extends State<QuestionApp> {
  var _selectedAwnser = 0;
  var _totalPoints = 0;

  final List<Map<String, Object>> _questions = const [
    {
      'text': 'Qual a sua cor favorita?',
      'awnser': [
        {'text': 'Preto', 'points': 10},
        {'text': 'Vermelho', 'points': 5},
        {'text': 'Verde', 'points': 3},
        {'text': 'Branco', 'points': 1},
      ],
    },
    {
      'text': 'Qual o seu animal favorito?',
      'awnser': [
        {'text': 'Coelho', 'points': 10},
        {'text': 'Cobra', 'points': 5},
        {'text': 'Elefante', 'points': 3},
        {'text': 'Leão', 'points': 1},
      ],
    },
    {
      'text': 'Qual seu instrutor favorito?',
      'awnser': [
        {'text': 'Maria', 'points': 10},
        {'text': 'João', 'points': 5},
        {'text': 'Léo', 'points': 3},
        {'text': 'Pedro', 'points': 1},

      ],
    }
  ];

  bool get hasSelectedQuestion {
    return _selectedAwnser < _questions.length;
  }

  void _awnser(int points) {
    if (hasSelectedQuestion) {
      setState(() {
        _selectedAwnser += 1;
        _totalPoints += points;
      });
    }
    print(_totalPoints);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Center(child: Text('Questions')),
            ),
            body: hasSelectedQuestion
                ? Quiz(
                    questions: _questions,
                    selectedAwnser: _selectedAwnser,
                    toRespond: _awnser,
                  )
                : const Result(text: 'Congratulations!!!')));
  }
}

class QuestionApp extends StatefulWidget {
  const QuestionApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuestionAppState createState() => _QuestionAppState();
}
