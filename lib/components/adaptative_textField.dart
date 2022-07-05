import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;
  final String labelText;
  final TextInputType keyboardType;

  const AdaptativeTextField({
    Key? key,
    required this.controller,
    required this.onSubmitted,
    required this.labelText,
    this.keyboardType = TextInputType.text,
  }): super(key: key);

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
              padding: const EdgeInsets.symmetric(
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
