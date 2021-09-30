import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_1/abstract/abstract.dart';
import 'package:test_1/services/profile_service.dart';
import 'package:test_1/ui/Screens/main/profile_button.dart';

part 'dev_emotional_event.dart';
part 'dev_emotional_state.dart';

class DevEmotionalBloc extends Bloc<DevEmotionalEvent, DevEmotionalState> {
  final ProfileService service;
  DevEmotionalBloc(this.service) : super(DevEmotionalInitial({}));

  @override
  Stream<DevEmotionalState> mapEventToState(
    DevEmotionalEvent event,
  ) async* {
    print(2);
    // TODO: implement mapEventToState
    if (event is DevEmotionalStarted) {
      final a = await service.getAll();
      yield DevEmotionalInitial(a);
    }
    else if (event is DevEmotionalPushed) {
      Map<String, int> counters = await this.service.increment(event.type);
      yield DevEmotionalSuccess(counters);
    }
  }
}
