import 'package:flutter/material.dart';

class TextFieldOfKidsFormFill extends StatefulWidget {
  final String labelText;
  const TextFieldOfKidsFormFill({super.key, required this.labelText});

  @override
  State<TextFieldOfKidsFormFill> createState() =>
      _TextFieldOfKidsFormFillState();
}

class _TextFieldOfKidsFormFillState extends State<TextFieldOfKidsFormFill> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.greenAccent),
            ),
            border: const OutlineInputBorder(),
            labelText: widget.labelText,
            labelStyle: const TextStyle(color: Colors.greenAccent)),
      ),
    );
  }
}
