import 'package:flutter/material.dart';
import 'package:test_1/assets/strings.dart';
import 'package:test_1/ui/Screens/Authorization/log_in.dart';
import 'package:test_1/ui/Screens/Authorization/registration.dart';
import 'package:test_1/ui/Screens/authorization/authorization.dart';

enum PageType {
  authorization,
  login,
}

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  /// Начальный экран
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.Auth),
      ),
      body: Center(
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  // return LogIn();
                  return Authorization(type: PageType.authorization,);
                }));
              },
              child: SizedBox(
                child: Center(
                  child: Text(Strings.log_in),
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
                  child: Text(Strings.reg),
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
