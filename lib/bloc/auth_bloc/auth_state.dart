part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  final String? uid = "";
}

class AuthInitial extends AuthState {}

class LoginSuccess extends AuthState {
  @override
  final String? uid;
  LoginSuccess(this.uid);
  
}

class LoginFailed extends AuthState {
  final String warning;

  LoginFailed({required this.warning});
}

class SignUpSuccess extends AuthState {}

class SignUpFailed extends AuthState {
  final String warning;
  SignUpFailed({required this.warning});
}
