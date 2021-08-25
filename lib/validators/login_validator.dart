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
    int i = 0;
    while ((data[i].login != this.login) && i < data.length) {
      print(this.login);
      print(data[i].password == this.password);
      i++;
    }
    if (i == data.length) {
      print("Неправильно");
      return false;
    }
    else {
      print("Жопа");
      return data[i].password == this.password;
    }
  }
}
