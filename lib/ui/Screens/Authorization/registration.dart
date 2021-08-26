import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_1/assets/strings.dart';
import 'package:test_1/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:test_1/ui/Screens/main/main_screen.dart';
import 'package:test_1/ui/widgets/entering_field.dart';
import 'package:test_1/ui/widgets/warning_field.dart';

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

  @override
  Widget build(BuildContext context) {
    const EdgeInsets pad = EdgeInsets.only(left: 10, right: 10, bottom: 10);

    final bloc = SignUpBloc();
    String warning = "";

    return BlocListener<SignUpBloc, SignUpState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is SignUpSuccess) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) {
            return MainScreen();
          }), (route) => true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(Strings.Auth),
        ),
        body: Column(
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
              child:
                  EnteringField(Strings.conf_pass, true, cPasswordController),
            ),
            BlocBuilder<SignUpBloc, SignUpState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is SignUpFailed) {
                  warning = state.warning;
                  return WarningField(isVisible: true, text: warning);
                }
                else {
                  return Container();
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                this.onPressedRegistrateButton(bloc);
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
        ),
      ),
    );
  }

  void onPressedRegistrateButton(Bloc bloc) {
    bloc.add(
      SignUpConfirm(
        email: emailController.text,
        name: nameController.text,
        password: passwordController.text,
        cPassword: this.cPasswordController.text,
      ),
    );
  }
}
