import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_1/modules/login_data.dart';

import '../test_globals.dart' as globals;
/// Производится запрос в Базу Данных
class LoginService {
  final FirebaseAuth _fAuth;

  LoginService([ FirebaseAuth? firebaseAuth]): _fAuth = firebaseAuth ?? FirebaseAuth.instance;

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
  Future<dynamic> signIn(String login, String password) async {
    return await this._fAuth.signInWithEmailAndPassword(email: login, password: password);
  }
}
