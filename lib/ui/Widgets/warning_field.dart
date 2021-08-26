import 'package:flutter/material.dart';

class WarningField extends StatelessWidget {
  final bool isVisible;
  final String text;
  WarningField({required this.isVisible, required this.text});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Center(
            child: Text(
              this.text,
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.red.shade300,
          ),
          constraints: BoxConstraints(
            minHeight: 30,
            minWidth: 80,
            maxWidth: 180
          ),
        ),
      ),
      visible: isVisible,
    );
  }
}
