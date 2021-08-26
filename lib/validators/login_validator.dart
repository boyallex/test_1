import 'package:test_1/modules/login_data.dart';

/// Класс для обработки данных логинизации.
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
    int position = _findLoginPosition(data);
    // если не находим
    if (position == data.length) {
      return false;
    } else {
      //если находим проверяем пароль
      return data[position].password == this.password;
    }
  }

  int _findLoginPosition(List<LoginData> data) {
    for (int i = 0; i < data.length; i++) {
      if (data[i].login == this.login) {
        return i;
      }
    }
    return data.length;
  }
}
