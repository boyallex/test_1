import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_1/abstract/abstract.dart';
import 'package:test_1/services/hive_service.dart';
import 'package:test_1/services/profile_service.dart';

part 'dev_emotional_event.dart';
part 'dev_emotional_state.dart';

class DevEmotionalBloc extends Bloc<DevEmotionalEvent, DevEmotionalState> {
  ProfileService service;
  // final String? uid;
  DevEmotionalBloc(this.service) : super(DevEmotionalInitial());

  @override
  Stream<DevEmotionalState> mapEventToState(
    DevEmotionalEvent event,
  ) async* {

    // TODO: implement mapEventToState
    if (event is SuicideEvent) {
      this.service.increment(ProfileButtonType.suicide);
      yield DevEmotionalSuicideSuccess();
    } else if(event is BleatEvent) {
      yield DevEmotionalBleatSuccess();
    } else if (event is GiveUpEvent) {
      yield DevEmotionalGiveUpSuccess();
    }
    else if (event is DevEmotionalStarted) { 
      HiveFile().read();
      yield DevEmotionalInitial();
    }
  }
}
