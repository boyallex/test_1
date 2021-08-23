part of 'login_bloc.dart';

// import 'form_status.dart';
// import 'form_status.dart';

@immutable
abstract class LoginState {
   
}

class LoginInitial extends LoginState {
  String? username;
  // bool get isValidUsername => username.length > 3;

  String? password;
  // bool get isValidPassword => password.length > 6;

  // FormSubmissionStatus formStatus;

  LoginInitial({
    this.username = '',
    this.password = '',
    // this.formStatus = const InitialFormStatus(),
  });

  LoginInitial copyWith({
    String? username,
    String? password,
    // FormSubmissionStatus formStatus,
  }) {
    return LoginInitial(
      username: username ?? this.username,
      password: password ?? this.password,
      // formStatus: formStatus ?? this.formStatus,
    );
  }
}