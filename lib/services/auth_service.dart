import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_1/modules/login_data.dart';
import '../test_globals.dart' as globals;

class AuthService {
  AuthService();

  Future signUp(String name, String login, String password) async {
    // await Firebase.initializeApp();
    final fireAuth = FirebaseAuth.instance;
    return fireAuth.createUserWithEmailAndPassword(
        email: login, password: password);
  }

  Future<dynamic> signOut() async {
    // await Firebase.initializeApp();
    final fireAuth = FirebaseAuth.instance;
    return Future.wait([fireAuth.signOut()]);
  }

  Future<List<LoginData>> getData() async {
    final data = globals.json;
    return Future.delayed(Duration()).then(
      (_) => data
          .map(
            (e) => LoginData.fromJson(e),
          )
          .toList(),
    );
  }


  Future<UserCredential> signIn(String login, String password) async {
    final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: login,
      password: password,
    );
    return user;
  }
}