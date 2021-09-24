import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:test_1/ui/Screens/Authorization/authorization.dart';
import 'package:test_1/ui/Screens/main/main_screen.dart';
import 'abstract/abstract.dart';
import 'ui/Screens/Authorization/start_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  runApp(MyApp());
}
//

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartScreen(),
      routes: {
        'auth': (context) => StartScreen(),
        'login': (context) => Authorization(
              type: PageType.login,
            ),
        'sign_up': (context) => Authorization(
              type: PageType.auth,
            ),
      },
    );
  }
}
