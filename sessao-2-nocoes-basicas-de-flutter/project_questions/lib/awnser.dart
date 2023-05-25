import 'package:flutter/material.dart';

class Awnser extends StatelessWidget {
  final String text;
  final void Function() selected;

  const Awnser(this.text, this.selected, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: selected,
        child: Text(text),
      ),
    );
  }
}