

import 'package:firebase_auth/firebase_auth.dart';

class SignUpService {
  final FirebaseAuth _fAuth;

  SignUpService({required FirebaseAuth firebaseAuth})
      : this._fAuth = firebaseAuth ?? FirebaseAuth.instance;

   Future<dynamic> signUp(String name, String login, String password) async {
     return this._fAuth.createUserWithEmailAndPassword(email: login, password: password);
   }
   Future<dynamic> signOut() async {
     return Future.wait([_fAuth.signOut()]);
   }
   
}