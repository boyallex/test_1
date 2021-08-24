part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}
class SignUpSuccess extends SignUpState{}
class SignUpFailed extends SignUpState {
  String warning;
  // final bool isVisible
  SignUpFailed({required this.warning});
}