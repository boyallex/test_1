abstract class SignUpController {
  String name;
  String password;
  String email;

  bool _isCorrect = false;

  SignUpController(this.name, this.email, this.password) {}

  bool isCorrectName() {
    return this.name.isNotEmpty;
  }

  bool isCorrectEmail() {
    bool isAted = false;
    int i = 0;
    if (this.email.isEmpty) {
      return false;
    } else {
      while (this.email[i] != "@" && i < this.email.length) {
        isAted = this.email[i] == "@";
        i++;
      }
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
      return false;
      // return "Password is too easy";
    }
    //
    else if (!isExistLetters & !isExistNumbers) {
        return false;
      // return "Password has to contain latin letters and numbers!";
    }
    // return "";
  return true;
    // return nonNullLogin.isNotEmpty & (nonNullLogin.length < 8) & nonNullLogin.
  }
}
