import 'package:test_1/assets/strings.dart';

/// Класс для обработки данных с Регистрации. Можно получить bool isCorrect (верные/неверные данные)
/// и вид ошибки warning
class SignUpValidator {
  String name;
  String password;
  String email;
  String cPassword;

  late bool _isCorrect;

  String _problemType = "";

  SignUpValidator(
      {required this.name,
      required this.email,
      required this.password,
      required this.cPassword}) {
    this._isCorrect = isCorrectEmail() &&
        isCorrectName() &&
        isCorrectPassword() &&
        isConfirmPassword();
  }
  bool get isCorrect => this._isCorrect;

  bool isCorrectName() {
    this._problemType =
        this.name.isNotEmpty ? " " : WarningStrings.unentereing_name;
    return this.name.isNotEmpty;
  }

  String warning() {
    return this._problemType;
  }

  bool isConfirmPassword() {
    if (this.cPassword != this.password) {
      this._problemType = WarningStrings.passwords_not_equal;
      return false;
    }
    return true;
  }

  bool isCorrectEmail() {
    if (this.email.isEmpty) {
      this._problemType = WarningStrings.invalid_email;
      return false;
    } else {
      bool isAted = this.email.contains("@");
      this._problemType = isAted ? " " : WarningStrings.invalid_email;
      return isAted;
    }
  }

  bool isCorrectPassword() {
    bool isExistLetters = false;
    bool isExistNumbers = false;

    for (int i = 0; i < this.password.length; i++) {
      // присутствие латинских букв
      int letter_code = this.password[i].codeUnits.first;
      if ((65 <= letter_code) & (letter_code <= 90)) {
        isExistLetters = true;
      }
      // проверка на присутсвие цифр
      int? num_letter = int.tryParse(this.password[i]);
      if (num_letter != null) {
        isExistLetters = true;
      }
    }
    // пустоста и количество знаков
    if ((this.password.length < 8)) {
      this._problemType = WarningStrings.passwords_easy;
      return false;
      // return "Password is too easy";
    }
    //
    else if (!isExistLetters & !isExistNumbers) {
      this._problemType = WarningStrings.password_has_to_contain;
      return false;
    }
    return true;
  }
}
