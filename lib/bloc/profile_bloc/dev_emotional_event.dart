part of 'dev_emotional_bloc.dart';

@immutable
abstract class DevEmotionalEvent {}
class DevEmotionalStarted extends DevEmotionalEvent {} 
class SuicideEvent extends DevEmotionalEvent {}
class BleatEvent extends DevEmotionalEvent {}
class GiveUpEvent extends DevEmotionalEvent {}
