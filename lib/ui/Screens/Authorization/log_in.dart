import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_1/assets/strings.dart';
import 'package:test_1/bloc/login_bloc/login_bloc.dart';
import 'package:test_1/ui/Screens/main/main_screen.dart';
import 'package:test_1/ui/Widgets/warning_field.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  // контроллеры

  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  //
  final bloc = LoginBloc();
  bool isWarningVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      bloc: bloc,
      listener: (context, state) {
        // TODO: implement listener
        if (state is LoginSuccess) {
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
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: Strings.login,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: Strings.password,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<LoginBloc, LoginState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is LoginFailed) {
                  return WarningField(
                    isVisible: isWarningVisible,
                    text: Strings.invalid_log_or_pass,
                  );
                }else {
                  return Container();
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                bloc.add(LoginCompare(
                    login: loginController.text,
                    password: passwordController.text));
                isWarningVisible = true;
              },
              child: SizedBox(
                child: Center(
                  child: Text(Strings.log_in),
                ),
                height: 40,
                width: 150,
              ),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
