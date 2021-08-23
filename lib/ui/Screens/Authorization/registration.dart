import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_1/assets/strings.dart';
import 'package:test_1/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:test_1/ui/Screens/main/main_screen.dart';
import 'package:test_1/ui/Widgets/EnteringField.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final nameController =TextEditingController();
  final emaleController = TextEditingController();
  final passwordController = TextEditingController();
  final cPasswordController = TextEditingController();

  void onConfirmData() {
    
  }
  
  @override
  Widget build(BuildContext context) {
    const EdgeInsets pad = EdgeInsets.only(left: 10, right: 10, bottom: 10);
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(Strings.Auth),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: EnteringField(Strings.name, nameController),
              ),
              Padding(
                padding: pad,
                child: EnteringField(Strings.email, emaleController)
              ),
              Padding(
                padding: pad,
                child: EnteringField(Strings.password, passwordController),
              ),
              Padding(
                padding: pad,
                child: EnteringField(Strings.conf_pass, cPasswordController),
              ),
              ElevatedButton(
                onPressed: () {
                  // if (this.nameController.text.isEmpty)
                  
                  // print(this.passwordController.text);
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context){
                      return MainScreen();
                  }), (route) => true);
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
      },
    );
  }
}
