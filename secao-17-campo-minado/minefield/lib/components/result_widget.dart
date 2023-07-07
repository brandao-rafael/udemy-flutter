// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool? win;
  final void Function() onRestart;

  const ResultWidget({
    Key? key,
    required this.win,
    required this.onRestart,
  }) : super(key: key);

  Color _getColor() {
    if (win == null) {
      return Colors.yellow;
    } else if (win == true) {
      return Colors.green[300]!;
    } else {
      return Colors.red[300]!;
    }
  }

  IconData _getIcon() {
    if (win == null) {
      return Icons.sentiment_satisfied_sharp;
    } else if (win == true) {
      return Icons.sentiment_very_satisfied_sharp;
    } else {
      return Icons.sentiment_very_dissatisfied_sharp;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: _getColor(),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: onRestart,
              icon: Icon(
                _getIcon(),
                color: Colors.black,
                size: 35,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
