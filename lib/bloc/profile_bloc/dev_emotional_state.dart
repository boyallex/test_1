part of 'dev_emotional_bloc.dart';

@immutable
abstract class DevEmotionalState {}

class DevEmotionalInitial extends DevEmotionalState { }
class DevEmotionalSuicideSuccess extends DevEmotionalState {}
class DevEmotionalBleatSuccess extends DevEmotionalState {}
class DevEmotionalGiveUpSuccess extends DevEmotionalState {}
class DevEmotionalFailed extends DevEmotionalState {}