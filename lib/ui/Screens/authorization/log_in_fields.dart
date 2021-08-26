import 'package:flutter/material.dart';
import 'package:test_1/assets/strings.dart';
import 'package:test_1/ui/Widgets/entering_field.dart';

class LogInFields extends StatelessWidget {
  LogInFields({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
          child: EnteringField(Strings.login, false, emailController),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: EnteringField(Strings.password, true, passwordController),
        ),
      ],
    );
  }
}
