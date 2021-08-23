part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {
  
}

class SignUpConfirm extends SignUpEvent{
  String name;
  String email;
  String password;
  SignUpConfirm(
      {required this.name, required this.email, required this.password});

  // String get Name => name;
  // String get Email => email;
  // String get Password => password;
}
