part of 'dev_emotional_bloc.dart';

@immutable
abstract class DevEmotionalState {}
class DevEmotionalInitial extends DevEmotionalState {
  ProfileRepository? buttons;
  DevEmotionalInitial(this.buttons);
}

class DevEmotionalFailed extends DevEmotionalState {
  final String? warning;
  DevEmotionalFailed(this.warning);
}
class DevEmotionalSuccess extends DevEmotionalState {
  final ProfileRepository counters;

  DevEmotionalSuccess(this.counters);
}