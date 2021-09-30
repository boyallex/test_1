part of 'dev_emotional_bloc.dart';

@immutable
abstract class DevEmotionalEvent {}
class DevEmotionalStarted extends DevEmotionalEvent {} 
class DevEmotionalPushed extends DevEmotionalEvent {
  final ProfileButtonType type;
  DevEmotionalPushed(this.type);
}