import 'package:flutter/material.dart';
import 'ui/Widgets/Screens/Authorization/authorization.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Authorization(),
    );
  }
}
