import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_1/bloc/auth_repository.dart';
import 'package:test_1/models/login_validator.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthRepository repository;
  // AuthorizationController cont;

  LoginBloc({required this.repository, required this.cont}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is LoginConfirm) {
        // yield LoginInitial();
        
    }
  }
}
