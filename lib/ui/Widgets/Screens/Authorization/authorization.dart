import 'package:flutter/material.dart';
import 'package:test_1/ui/Widgets/Screens/Authorization/log_in.dart';
import 'package:test_1/ui/Widgets/Screens/Authorization/registration.dart';

class Authorization extends StatefulWidget {
  const Authorization({Key? key}) : super(key: key);

  @override
  _AuthorizationState createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Authorization"),
      ),
      body: Center(
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LogIn();
                }));
              },
              child: SizedBox(
                child: Center(
                  child: Text("Log in"),
                ),
                width: 110,
                height: 40,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Registration();
                }));
              },
              child: SizedBox(
                child: Center(
                  child: Text("Registration"),
                ),
                width: 110,
                height: 40,
              ),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
    );
  }
}
