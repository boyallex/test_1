import 'package:flutter/material.dart';

class WarningField extends StatelessWidget {
  final bool isVisible;
  WarningField({required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Text(
            "У вас ошибка",
          ),
        ),
      ),
      visible: isVisible,
    );
  }
}
