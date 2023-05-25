import 'package:flutter/material.dart';
import 'package:project_questions/awnser.dart';
import './question.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _selectedAwnser = 0;

  void _awnser() {
    setState(() {
      _selectedAwnser += 1;
    });
    print(_selectedAwnser);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> questions = [
      'Qual a sua cor favorita?',
      'Qual o seu animal favorito?',
    ];

    final List<String> awnsers = [
      'Resposta 1',
      'Resposta 2',
      'Resposta 3',
      'Resposta 4',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Questions')
          ),
        ),
        body: Column(
          children: [
            Question(questions[_selectedAwnser]),
            Awnser(awnsers[0], _awnser),
            Awnser(awnsers[1], _awnser),
            Awnser(awnsers[2], _awnser),
            Awnser(awnsers[3], _awnser),
          ]
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