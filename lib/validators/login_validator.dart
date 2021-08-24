class LoginValidator {
  final String? firstLogin;
  final String? firstPassword;
  final String? secondPassword;
  final String? secondLogin;
  bool isCorrect = false;

  LoginValidator({
    this.firstLogin,
    this.secondLogin,
    this.firstPassword,
    this.secondPassword,
  }) {
    isCorrect = (this.firstLogin == this.secondLogin) &&
        (this.firstPassword == this.secondPassword);
  }
}
