import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_1/modules/login_data.dart';
import 'package:test_1/services/login_service.dart';
import 'package:test_1/validators/login_validator.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final service = LoginService();
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is LoginCompare) {
      final data = await service.getData();
      final validator = LoginValidator(
        data: data,
        login: event.login,
        password: event.password,
      );

      if (validator.isCorrect) {
        yield LoginSuccess();
      } else {
        yield LoginFailed();
      }
    }
  }
}
