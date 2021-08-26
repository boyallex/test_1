import 'package:flutter/material.dart';
import 'package:test_1/assets/strings.dart';
import 'package:test_1/ui/Widgets/entering_field.dart';


class SignUpFields extends StatelessWidget {
  SignUpFields({ Key? key }) : super(key: key);

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    const EdgeInsets pad = EdgeInsets.only(left: 10, right: 10, bottom: 10);
    return  Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: EnteringField(Strings.name, false, nameController),
          ),
          Padding(
            padding: pad,
            child: EnteringField(Strings.email, false, emailController),
          ),
          Padding(
            padding: pad,
            child: EnteringField(Strings.password, true, passwordController),
          ),
          Padding(
            padding: pad,
            child: EnteringField(Strings.conf_pass, true, cPasswordController),
          ),
        ],
      );
  }
}