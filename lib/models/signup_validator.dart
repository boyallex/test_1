class SignUpValidator {
  String name;
  String password;
  String email;

  late bool _isCorrect;

  String _problemType = "";

  SignUpValidator(this.name, this.email, this.password){
    this._isCorrect = isCorrectEmail() && isCorrectName() && isCorrectPassword();
  }
  bool get isCorrect => this._isCorrect;

  bool isCorrectName() {
    this._problemType = this.name.isNotEmpty ? " " : "You didn't enter your name";
    return this.name.isNotEmpty;
  }
  String warning() {
    return this._problemType;
  }

  bool isCorrectEmail() {
    bool isAted = false;
    int i = 0;
    if (this.email.isEmpty) {
      this._problemType = "Invalid email";
      return false;
    } else {
      while (this.email[i] != "@" && i < this.email.length) {
        isAted = this.email[i] == "@";
        i++;
      }
      this._problemType = isAted ? " " : "Invalid email";
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
      this._problemType = "Password is too easy";
      return false;
      // return "Password is too easy";
    }
    //
    else if (!isExistLetters & !isExistNumbers) {
      this._problemType = "Password has to contain latin letters and numbers!";
        return false;
      // return "Password has to contain latin letters and numbers!";
    }
    // return "";
  return true;
    // return nonNullLogin.isNotEmpty & (nonNullLogin.length < 8) & nonNullLogin.
  }
}
