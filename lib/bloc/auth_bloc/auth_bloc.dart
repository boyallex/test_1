import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:test_1/services/auth_service.dart';
import 'package:test_1/validators/signup_validator.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    final service = AuthService();
    if (event is LoginCompare) {
      try {
        var result = await service.signIn(event.login, event.password);
        // FirebaseAuth.instance.authStateChanges();
         yield LoginSuccess();
      } on FirebaseAuthException catch (e) {
        print(e.message);
        yield LoginFailed(warning: e.message!);
      }
    } else if (event is SignUpConfirm) {
      final validator = SignUpValidator(
        name: event.name,
        email: event.email,
        password: event.password,
        cPassword: event.cPassword,
      );
      if (validator.isCorrect) {
        service.signUp(event.name, event.email, event.password);
        yield SignUpSuccess();
      } else {
        yield SignUpFailed(
          warning: validator.warning(),
        );
      }
    }
  }
}
