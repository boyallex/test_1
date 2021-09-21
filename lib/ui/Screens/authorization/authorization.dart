import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_1/abstract/abstract.dart';
import 'package:test_1/assets/strings.dart';
import 'package:test_1/bloc/auth_bloc/auth_bloc.dart';
import 'package:test_1/ui/Screens/Authorization/log_in_fields.dart';
import 'package:test_1/ui/Screens/Authorization/sign_up_fields.dart';
import 'package:test_1/ui/Screens/main/main_screen.dart';
import 'package:test_1/ui/widgets/warning_field.dart';

class Authorization extends StatelessWidget {
  PageType type;
  Authorization({required this.type});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  late String warning = "";

  @override
  Widget build(BuildContext context) {
    final bloc = AuthBloc();

    return BlocListener<AuthBloc, AuthState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is LoginSuccess || state is SignUpSuccess) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) {
                return MainScreen();
              },
            ),
            (route) => true,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(Strings.Auth),
        ),
        body: Column(
          children: [
            // верстка полей
            getFields(this.type),
            // блок билдер, контролирующий поле ошибок
            BlocBuilder<AuthBloc, AuthState>(
              bloc: bloc,
              builder: (context, state) {
                if ((state is SignUpFailed)) {
                  warning = state.warning;
                  return WarningField(isVisible: true, text: warning);
                } else if (state is LoginFailed) {
                  warning = state.warning;
                  return WarningField(isVisible: true, text: warning);
                } else {
                  return Container();
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                type == PageType.auth
                    ? this.onPressedRegistrateButton(bloc)
                    : this.onPressedLoginButton(bloc);
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

  void onPressedRegistrateButton(bloc) {
    bloc.add(
      SignUpConfirm(
        email: emailController.text,
        name: nameController.text,
        password: passwordController.text,
        cPassword: this.cPasswordController.text,
      ),
    );
  }

  void onPressedLoginButton(bloc) {
    bloc.add(
      LoginCompare(
        login: emailController.text,
        password: passwordController.text,
      ),
    );
  }

  Widget getFields(PageType authType) {
    var fields;
    if (authType == PageType.login) {
      fields = LogInFields();
      this.emailController = fields.emailController;
      this.passwordController = fields.passwordController;
    } else if (authType == PageType.auth) {
      fields = SignUpFields();
      this.emailController = fields.emailController;
      this.passwordController = fields.passwordController;
      this.nameController = fields.nameController;
      this.cPasswordController = fields.cPasswordController;
    }
    return fields;
  }
}
