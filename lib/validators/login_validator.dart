import 'package:test_1/modules/login_data.dart';

class LoginValidator {
  final String login;
  final String password;
  final List<LoginData> data;
  bool isCorrect = false;

  LoginValidator({
    required this.login,
    required this.password,
    required this.data,
  }) {
    this.isCorrect = this._isCorrect();
  }

  bool _isCorrect() {
    // ищем логин
    int i = 0;
    while ((i < data.length) && (data[i].login != this.login)) { i++; }
    // если не находим
    if (i == data.length) {
      return false;
    }
    else {
      //если находим проверяем пароль 
      return data[i].password == this.password;
    }
  }
}
