import 'package:flutter/material.dart';

class EnteringField extends StatelessWidget {
  late String? text;
  late TextEditingController? controller;
  late bool isCorrect = true;
  late bool isPassword;
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
