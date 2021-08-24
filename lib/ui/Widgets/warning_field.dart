import 'package:flutter/material.dart';

class WarningField extends StatelessWidget {
  final bool isVisible;
  final String text;
  WarningField({required this.isVisible, required this.text});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          color: Colors.red,
          child: Text(
            this.text,
          ),
        ),
      ),
      visible: isVisible,
    );
  }
}
