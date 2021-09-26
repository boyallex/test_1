part of 'dev_emotional_bloc.dart';

@immutable
abstract class DevEmotionalState {}

class DevEmotionalInitial extends DevEmotionalState { }
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