import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_1/assets/strings.dart';
import 'package:test_1/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:test_1/ui/Screens/main/main_screen.dart';
import 'package:test_1/ui/Widgets/EnteringField.dart';
import 'package:test_1/ui/Widgets/warning_field.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cPasswordController = TextEditingController();

  void onConfirmData() {}

  @override
  Widget build(BuildContext context) {
    const EdgeInsets pad = EdgeInsets.only(left: 10, right: 10, bottom: 10);
    // BlocProvider _bloc = BlocProvider.of(context);
    final bloc = SignUpBloc();
    bool isWarningVisible = false;

    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.Auth),
      ),
      body: BlocBuilder<SignUpBloc, SignUpState>(
        bloc: bloc,
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: EnteringField(Strings.name, nameController),
              ),
              Padding(
                  padding: pad,
                  child: EnteringField(Strings.email, emailController)),
              Padding(
                padding: pad,
                child: EnteringField(Strings.password, passwordController),
              ),
              Padding(
                padding: pad,
                child: EnteringField(Strings.conf_pass, cPasswordController),
              ),
              WarningField(isVisible: isWarningVisible),
              ElevatedButton(
                onPressed: () {
                  bloc.add(
                    SignUpConfirm(
                      email: emailController.text,
                      name: nameController.text,
                      password: passwordController.text,
                    ),
                  );
                  if (state is SignUpFailed) {
                    isWarningVisible = true;
                  } else {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) {
                      return MainScreen();
                    }), (route) => true);
                  }
                },
                child: SizedBox(
                  child: Center(
                    child: Text(Strings.sign_up),
                  ),
                  height: 40,
                  width: 150,
                ),
              ),
             
              
            ],
          );
        },
      ),
    );
  }
}
