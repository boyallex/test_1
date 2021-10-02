import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  AuthService();

  Future<UserCredential?> signUp(
      String name, String login, String password) async {
    // await Firebase.initializeApp();
    final fireAuth = FirebaseAuth.instance;
    final UserCredential? user = await fireAuth.createUserWithEmailAndPassword(email: login, password: password);
    // создаем документ на пользователя в Firestore
    final Map<String, int> userData = {
      "suicide": 0,
      "give_up": 0,
      "bleat": 0,
    };
    
    final String? uid = user != null ? user.user!.uid : "";
    await FirebaseFirestore.instance.collection("users").doc(uid).set(userData);
    return user;
  }

  Future<dynamic> signOut() async {
    // await Firebase.initializeApp();
    final fireAuth = FirebaseAuth.instance;
    return Future.wait([fireAuth.signOut()]);
  }

  Future<UserCredential> signIn(String login, String password) async {
    final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: login,
      password: password,
    );
    return user;
  }
}
