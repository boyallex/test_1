class AuthorizationController {
  String? name;
  String? login;
  String? password;
  String? email;

  String? _nameError;
  String? _loginError;
  String? _passwordError;
  String? _emailError;

  bool? _isCorrect;

  AuthorizationController(
      {required this.name, this.login, this.password, this.email});
  AuthorizationController.checkLogIn({this.login, this.password}) {
    
  }

  bool isCorrectName() {
    String nonNullName = this.name!;
    return nonNullName.isNotEmpty;
  }

  // bool isCorrectPassword() {c
  //   String nonNullPassword = this.password!;
  //   bool isCorrect = true;
  //   bool isExistLetters = false;
  //   bool isExistNumbers = false;

  //   for (int i = 0; i < nonNullPassword.length; i++) {
  //     // присутствие латинских букв
  //     int letter_code = nonNullPassword[i].codeUnits.first;
  //     if ((65 <= letter_code) & (letter_code <= 90)) {
  //       isExistLetters = true;
  //     }
  //     // проверка на присутсвие цифр
  //     int? num_letter = int.tryParse(nonNullPassword[i]);
  //     if (num_letter != null) {
  //       isExistLetters = true;
  //     }
  //   }
  //   // пустоста и количество знаков
  //   if ((nonNullPassword.length < 8)) {
  //     return false;
  //     // return "Password is too easy";
  //   }
  //   //
  //   else if (!isExistLetters & !isExistNumbers) {
      
  //     // return "Password has to contain latin letters and numbers!";
  //   }
  //   // return "";

  //   // return nonNullLogin.isNotEmpty & (nonNullLogin.length < 8) & nonNullLogin.
  // }
}
