

import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_1/services/auth_service.dart';

class SignUpService  {

  SignUpService();

   Future signUp(String name, String login, String password) async {
     final fireAuth = FirebaseAuth.instance;
     return fireAuth.createUserWithEmailAndPassword(email: login, password: password);
   }
   Future<dynamic> signOut() async {
    final fireAuth = FirebaseAuth.instance;
    return Future.wait([fireAuth.signOut()]);
  }
   
}