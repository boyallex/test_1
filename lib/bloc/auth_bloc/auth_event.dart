part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginCompare extends AuthEvent {
  final String login;
  final String password;

  LoginCompare({required this.login, required this.password});
} 

class SignUpConfirm extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String cPassword; // пароль для сравнения
  SignUpConfirm({
    required this.name,
    required this.email,
    required this.password,
    required this.cPassword,
  });
}
