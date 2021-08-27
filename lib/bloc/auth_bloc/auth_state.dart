part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginFailed extends AuthState {
  final String warning;

  LoginFailed({required this.warning});
}

class SignUpSuccess extends AuthState {}

class SignUpFailed extends AuthState {
  final String warning;
  SignUpFailed({required this.warning});
}
