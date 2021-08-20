import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'authorication_event.dart';
part 'authorication_state.dart';

class AuthoricationBloc extends Bloc<AuthoricationEvent, AuthoricationState> {
  AuthoricationBloc() : super(AuthoricationInitial());

  @override
  Stream<AuthoricationState> mapEventToState(
    AuthoricationEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
