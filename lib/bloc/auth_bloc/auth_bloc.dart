import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';
import 'package:test_1/services/auth_service.dart';
import 'package:test_1/services/hive_service.dart';
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
    late final user;
    late String uid;
    if (event is LoginCompare) {
      try {
        user = await service.signIn(event.login, event.password);
        // FirebaseAuth.instance.authStateChanges();

        uid = user != null ? user.user.uid : "";
        HiveFile().write(uid); // записываем uid после входа

        yield LoginSuccess(uid);
      } on FirebaseAuthException catch (e) {
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
        yield SignUpSuccess();
      } else {
        yield SignUpFailed(
          warning: validator.warning(),
        );
      }
    }
  }
}
