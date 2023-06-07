import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function() onSubmit;
  final TextInputType keyboardType;
  final String label;

  const AdaptativeTextField(
      {super.key,
      required this.controller,
      required this.onSubmit,
      required this.keyboardType,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? 
      CupertinoTextField(
        controller: controller,
        onSubmitted: (_) => onSubmit(),
        keyboardType: keyboardType,
        placeholder: label,
      )
    : TextField(
      controller: controller,
      onSubmitted: (_) => onSubmit(),
      keyboardType: keyboardType,
      decoration: InputDecoration(labelText: label),
    );
  }
}
