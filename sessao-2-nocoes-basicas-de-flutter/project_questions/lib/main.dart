import 'package:flutter/material.dart';
import 'package:project_questions/awnser.dart';
import './question.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
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

    List<String> awnsers = hasSelectedQuestion
      ? _questions[_selectedAwnser]['awnser'] as List<String>
      : [];
    List<Widget> widgets = awnsers.map((text) => Awnser(text, _awnser)).toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Questions')
          ),
        ),
        body: hasSelectedQuestion ? Column(
          children: [
            Question(_questions[_selectedAwnser]['text'].toString()),
            ...widgets,
          ]
        ) : const Center(
          child: Text(
            'Congratulations!',
            style: TextStyle(
              fontSize: 28
            ),
            ),
        ),
      )
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}