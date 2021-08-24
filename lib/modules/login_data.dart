class LoginData {
  final String login;
  final String password;

  LoginData({required this.login, required this.password});

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      login: json["login"],
      password: json["password"],
    );
  }
}
