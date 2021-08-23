part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginConfirm extends LoginEvent {
  final String? username;

  LoginConfirm({this.username});
  String? get name => this.username;
}

// class LoginPasswordChanged extends LoginEvent {
//   final String? password;

//   LoginPasswordChanged({this.password});
// }

// class LoginSubmitted extends LoginEvent {}
