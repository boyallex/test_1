part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {
  
}

class SignUpConfirm extends SignUpEvent{
  final String name;
  final String email;
  final String password;
  final String cPassword; // пароль для сравнения
  SignUpConfirm(
      {required this.name, required this.email, required this.password, required this.cPassword});

  // String get Name => name;
  // String get Email => email;
  // String get Password => password;
}
