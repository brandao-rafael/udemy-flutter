import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function() onSubmit;
  final TextInputType keyboardType;
  final String label;

  const AdaptativeTextField({
    super.key,
    required this.controller,
    required this.onSubmit,
    this.keyboardType = TextInputType.text,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
          ),
          child: CupertinoTextField(
              controller: controller,
              onSubmitted: (_) => onSubmit(),
              keyboardType: keyboardType,
              placeholder: label,
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
        )
        : TextField(
            controller: controller,
            onSubmitted: (_) => onSubmit(),
            keyboardType: keyboardType,
            decoration: InputDecoration(labelText: label),
          );
  }
}
