import 'package:flutter/material.dart';

void main() => runApp(PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var selectedAwnser = 0;

  void awnser() {
    setState(() {
      selectedAwnser += 1;
    });
    print(selectedAwnser);
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
            Text(questions[selectedAwnser]),
            ElevatedButton(
              onPressed: awnser,
              child: Text('resposta 1')
            ),
            ElevatedButton(
              onPressed: awnser,
              child: Text('resposta 2')
            ),
            ElevatedButton(
              onPressed: awnser,
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
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}