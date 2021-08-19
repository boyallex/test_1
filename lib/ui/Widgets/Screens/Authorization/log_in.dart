import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Authorization"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Login",
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
                labelText: "Password",
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: SizedBox(
              child: Center(
                child: Text("Log In"),
              ),
              height: 40,
              width: 150,
            ),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
