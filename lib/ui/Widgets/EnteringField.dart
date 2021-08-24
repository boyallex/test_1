import 'package:flutter/material.dart';

class EnteringField extends StatelessWidget {
  String? text;
  TextEditingController? controller;
  bool isCorrect = true;
  bool isPassword;
  EnteringField(this.text, this.isPassword,[this.controller, this.isCorrect = true]);
  

  @override
  Widget build(BuildContext context) {
    Color color; 
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
