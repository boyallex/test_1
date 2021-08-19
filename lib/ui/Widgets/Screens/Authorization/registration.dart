import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Authorization"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: EnteringField("Name", nameController),
          ),
          Padding(
            padding: pad,
            child: EnteringField("Emaile", emaleController)
          ),
          Padding(
            padding: pad,
            child: EnteringField("Password", passwordController),
          ),
          Padding(
            padding: pad,
            child: EnteringField("Confirm password", cPasswordController),
          ),
          ElevatedButton(
            onPressed: () {
              // if (this.nameController.text.isEmpty)
            },
            child: SizedBox(
              child: Center(
                child: Text("Sign Up"),
              ),
              height: 40,
              width: 150,
            ),
          ),
        ],
      ),
    );
  }
}
