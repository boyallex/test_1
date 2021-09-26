import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_1/abstract/abstract.dart';
import 'package:test_1/services/hive_service.dart';
import 'package:test_1/services/profile_service.dart';

part 'dev_emotional_event.dart';
part 'dev_emotional_state.dart';

class DevEmotionalBloc extends Bloc<DevEmotionalEvent, DevEmotionalState> {
  DevEmotionalBloc() : super(DevEmotionalInitial());
  ProfileService service = ProfileService(HiveFile().read().toString());

  @override
  Stream<DevEmotionalState> mapEventToState(
    DevEmotionalEvent event,
  ) async* {
    String uid = HiveFile().read().toString();
    print(2);
    // TODO: implement mapEventToState
    if (event is DevEmotionalStarted) {      
      yield DevEmotionalInitial();
    } else if (event is BleatEvent) {
      int? count = this.service.increment(ProfileButtonType.bleat, 2);
      yield DevEmotionalBleatSuccess(count);
    } else if (event is GiveUpEvent) {
      int? count = this.service.increment(ProfileButtonType.give_up, 3);
      yield DevEmotionalGiveUpSuccess(count );
    } else if (event is SuicideEvent) {
      int? count = this.service.increment(ProfileButtonType.suicide, 3);
      yield DevEmotionalSuicideSuccess(count);
     }
  }
}
