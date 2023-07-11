import 'package:flutter/material.dart';

class EntryTime extends StatelessWidget {
  final String title;
  final int value;

  const EntryTime({
    required this.value,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Text('$value'),
      ],
    );
  }
}
