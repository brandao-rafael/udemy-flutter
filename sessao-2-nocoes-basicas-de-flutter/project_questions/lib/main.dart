import 'package:flutter/material.dart';
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
            ElevatedButton(
              onPressed: _awnser,
              child: Text('resposta 1')
            ),
            ElevatedButton(
              onPressed: _awnser,
              child: Text('resposta 2')
            ),
            ElevatedButton(
              onPressed: _awnser,
              child: Text('resposta 3')
            ),
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