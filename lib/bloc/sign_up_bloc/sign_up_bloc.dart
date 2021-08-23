import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_1/models/signup_validator.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  // SignUpValidator validator;

  SignUpBloc() : super(SignUpInitial());

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is SignUpConfirm) {
      if (SignUpValidator(event.name, event.email, event.password).isCorrect) {
        yield SignUpSuccess();
      } else {
        yield SignUpFailed(
          warning: SignUpValidator(
            event.name,
            event.email,
            event.password,
          ).warning(),
        );
      }
    }
  }
}
