import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  late final TextEditingController controller;
  late final Function(String) onSubmitted;
  late final String labelText;
  late final TextInputType keyboardType;

  AdaptativeTextField({
    required this.controller,
    required this.onSubmitted,
    required this.labelText,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: CupertinoTextField(
              controller: controller,
              onSubmitted: onSubmitted,
              placeholder: labelText,
              keyboardType: keyboardType,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            controller: controller,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              labelText: labelText,
            ),
            keyboardType: keyboardType,
          );
  }
}
