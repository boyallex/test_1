import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_1/abstract/abstract.dart';
import 'package:test_1/repositories/profile_repository.dart';
import 'package:test_1/services/hive_service.dart';
import 'package:test_1/services/profile_service.dart';
part 'dev_emotional_event.dart';
part 'dev_emotional_state.dart';

class DevEmotionalBloc extends Bloc<DevEmotionalEvent, DevEmotionalState> {
  final ProfileService service;
  DevEmotionalBloc(this.service)
      : super(DevEmotionalInitial(ProfileRepository.empty()));

  @override
  Stream<DevEmotionalState> mapEventToState(
    DevEmotionalEvent event,
  ) async* {
    if (event is DevEmotionalStarted) {
      var s = await service.getAll();
      if (s.isEmpty()) {
        service.rememberHiveDate();
        yield DevEmotionalInitial(s);
      } else if (await service.isOpened()) {
        yield DevEmotionalInitial(s);
      } else { 
        s = await service.rememberDate(s);
        yield DevEmotionalInitial(s);
      }
    } else if (event is DevEmotionalPushed) {
      ProfileRepository counters = await this.service.increment(event.type);
      yield DevEmotionalSuccess(counters);
    }
  }
}
