import 'package:flutter/material.dart';

class EnteringField extends StatelessWidget {
  final String? text;
  final TextEditingController? controller;
  late bool isCorrect = true;
  final bool isPassword;
  EnteringField(this.text, this.isPassword,[this.controller, this.isCorrect = true]);
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: this.isPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: this.text,
      ),
      controller: controller,
    );
  }
}
