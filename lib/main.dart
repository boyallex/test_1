import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'ui/Screens/Authorization/start_screen.dart';

void main() async {
  await Firebase.initializeApp();
  runApp(MyApp());
}
// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       // Initialize FlutterFire
//       future: Firebase.initializeApp(),
//       builder: (context, snapshot) {
//         // Check for errors
//         if (snapshot.hasError) {
//           // return SomethingWentWrong();
//           return Container();
//         }

//         // Once complete, show your application
//         if (snapshot.connectionState == ConnectionState.done) {
//           return MyApp();
//         }

//         // Otherwise, show something whilst waiting for initialization to complete
//         // return Loading();
//         return Container();
//       },
//     );
//   }
// }

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
    );
  }
}
