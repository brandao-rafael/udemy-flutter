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
    final List<Map<String, Object>> questions = [
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

    List<String> awnsers = questions[_selectedAwnser]['awnser'] as List<String>;

    List<Widget> widgets = awnsers.map((text) => Awnser(text, _awnser)).toList();

    // for (var awnser in awnsers) {
    //   widgets.add(Awnser(awnser, _awnser));
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Questions')
          ),
        ),
        body: Column(
          children: [
            Question(questions[_selectedAwnser]['text'].toString()), // add toString()
            ...widgets,
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