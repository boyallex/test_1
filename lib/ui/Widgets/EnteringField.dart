import 'package:flutter/material.dart';

class EnteringField extends StatelessWidget {
  String? text;
  TextEditingController? controller;
  bool isCorrect = true;
  EnteringField(this.text, [this.controller, this.isCorrect = true]);
  

  @override
  Widget build(BuildContext context) {
    Color color; 
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: this.text,
      ),
      controller: controller,
      smartDashesType: SmartDashesType.enabled,
    );
  }
}
