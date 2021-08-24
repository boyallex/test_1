class SignUpValidator {
  String name;
  String password;
  String email; 
  String cPassword;

  late bool _isCorrect;

  String _problemType = "";

  SignUpValidator(this.name, this.email, this.password, this.cPassword) {
    print(isCorrectEmail());
    this._isCorrect =
        isCorrectEmail() && isCorrectName() && isCorrectPassword();
  }
  bool get isCorrect => this._isCorrect;

  bool isCorrectName() {
    this._problemType =
        this.name.isNotEmpty ? " " : "You didn't enter your name";
    return this.name.isNotEmpty;
  }

  String warning() {
    return this._problemType;
  }
  bool isConfirmPassword() {
    if (this.cPassword != this.password) {
      this._problemType = "Passwords are not equal";
      return false;
    }
    return true;
  }

  bool isCorrectEmail() {
    if (this.email.isEmpty) {
      this._problemType = "Invalid email";
      return false;
    } else {
      bool isAted = false;
      int i = 1;
      while (this.email[i - 1] != "@" && i < this.email.length) {
        if (this.email[i] == "@") {
          isAted = true;
        }
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
