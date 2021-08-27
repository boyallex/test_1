import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_1/modules/login_data.dart';
import '../test_globals.dart' as globals;

class AuthService {
  AuthService();

  Future signUp(String name, String login, String password) async {
    final fireAuth = FirebaseAuth.instance;
    return fireAuth.createUserWithEmailAndPassword(
        email: login, password: password);
  }

  Future<dynamic> signOut() async {
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

  Future signIn(String login, String password) {
    return FirebaseAuth.instance.signInWithEmailAndPassword(
      email: login,
      password: password,
    );
  }
}
