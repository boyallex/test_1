part of 'dev_emotional_bloc.dart';

@immutable
abstract class DevEmotionalState {}

class DevEmotionalInitial extends DevEmotionalState {
  Map<String, dynamic>? buttons;
  DevEmotionalInitial(this.buttons);
}
class DevEmotionalSuicideSuccess extends DevEmotionalState {
  final int? counter;
  DevEmotionalSuicideSuccess(this.counter);
}
class DevEmotionalBleatSuccess extends DevEmotionalState {
  final int? counter;
  DevEmotionalBleatSuccess(this.counter);
}
class DevEmotionalGiveUpSuccess extends DevEmotionalState {
  final int? counter;
  DevEmotionalGiveUpSuccess(this.counter);
}
class DevEmotionalFailed extends DevEmotionalState {
  final String? warning;
  DevEmotionalFailed(this.warning);
}
class DevEmotionalSuccess extends DevEmotionalState {
  final Map<String, int> counters;

  DevEmotionalSuccess(this.counters);
}