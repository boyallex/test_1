import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_1/assets/strings.dart';
import 'package:test_1/bloc/login_bloc/login_bloc.dart';
import 'package:test_1/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:test_1/ui/Screens/Authorization/start_screen.dart';
import 'package:test_1/ui/Screens/authorization/log_in_fields.dart';
import 'package:test_1/ui/Screens/authorization/sign_up_fields.dart';
import 'package:test_1/ui/Widgets/entering_field.dart';
import 'package:test_1/ui/Widgets/warning_field.dart';

class Authorization extends StatelessWidget {
  PageType? type;
  Authorization({required this.type});
  var nameController;
  var emailController;
  var passwordController;
  var cPasswordController;

  // final bloc = SignUpBloc();
  late String warning = "";

  @override
  Widget build(BuildContext context) {
    final bloc = type == PageType.authorization ? SignUpBloc() : LoginBloc();
    const EdgeInsets pad = EdgeInsets.only(left: 10, right: 10, bottom: 10);

    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.Auth),
      ),
      body: Column(
        children: [
          // верстка полей
          getFields(this.type!),
          // блок билдер, контролирующий поле ошибок
          getBloc(this.type!, bloc),
          ElevatedButton(
            onPressed: () {
              type == PageType.authorization
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

  BlocBuilder getBloc(PageType authType, dynamic bloc) {
    if (authType == PageType.authorization) {
      return BlocBuilder<SignUpBloc, SignUpState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is SignUpFailed) {
              warning = state.warning;
              return WarningField(isVisible: true, text: warning);
            } else {
              return Container();
            }
          });
    } else {
      return BlocBuilder<LoginBloc, LoginState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is LoginFailed) {
            return WarningField(
              isVisible: true,
              text: state.warning,
            );
          } else {
            return Container();
          }
        },
      );
    }
  }

  Widget getFields(PageType authType) {
    var fields;
    if (authType == PageType.login) {
      fields = LogInFields();
      this.emailController = fields.emailController;
      this.passwordController = fields.passwordController;
    } else if (authType == PageType.authorization) {
      fields = SignUpFields();
      this.emailController = fields.emailController;
      this.passwordController = fields.passwordController;
      this.nameController = fields.nameController;
      this.cPasswordController = fields.cPasswordController;
    }
    return fields;
  }
}
