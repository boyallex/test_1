import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_1/bloc/login_bloc/login_bloc.dart';
import 'package:test_1/modules/login_data.dart';
import 'package:test_1/services/auth_service.dart';

import '../test_globals.dart' as globals;

/// Производится запрос в Базу Данных
class LoginService {

  LoginService();

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
