import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_1/abstract/abstract.dart';
import 'package:test_1/assets/strings.dart';
import 'package:test_1/bloc/profile_bloc/dev_emotional_bloc.dart';
import 'package:test_1/services/profile_service.dart';
import 'package:test_1/ui/Screens/main/profile_button.dart';

class MainScreen extends StatelessWidget {
  MainScreen();
  final DevEmotionalBloc _bloc = DevEmotionalBloc(ProfileService())
    ..add(DevEmotionalStarted());

  @override
  Widget build(BuildContext context) {
    // this._bloc.add(DevEmotionalStarted());

    return BlocListener<DevEmotionalBloc, DevEmotionalState>(
      bloc: this._bloc,
      listener: (context, state) {},
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(
            children: [
              ProfileButton('images/suicide.jpg', () {
                _bloc.add(DevEmotionalPushed(ProfileButtonType.suicide));
              }),
              SizedBox(
                child: Center(
                  child: BlocBuilder<DevEmotionalBloc, DevEmotionalState>(
                    bloc: this._bloc,
                    builder: suicideBuilder,
                  ),
                ),
                height: 30,
              ),
              ProfileButton('images/give_up.jpg', () {
                _bloc.add(DevEmotionalPushed(ProfileButtonType.give_up));
              }),
              SizedBox(
                child: Center(
                  child: BlocBuilder<DevEmotionalBloc, DevEmotionalState>(
                    bloc: this._bloc,
                    builder: giveUpBuilder,
                  ),
                ),
                height: 30,
              ),
              ProfileButton('images/bleat.jpg', () {
                _bloc.add(DevEmotionalPushed(ProfileButtonType.bleat));
              }),
              SizedBox(
                child: Center(
                  child: BlocBuilder<DevEmotionalBloc, DevEmotionalState>(
                    bloc: this._bloc,
                    builder: bleatBuilder,
                  ),
                ),
                height: 40,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text("Суицид: "),
                      BlocBuilder<DevEmotionalBloc, DevEmotionalState>(
                        bloc: this._bloc,
                        builder: (context, state) {
                          if (state is DevEmotionalSuccess) {
                            return Text(state
                                .counters.lastUserEmotions!["suicide"]
                                .toString());
                          } else if (state is DevEmotionalInitial) {
                            return Text(state
                                .buttons!.lastUserEmotions!["suicide"]
                                .toString());
                          } else {
                            return Text("Something went wrong");
                          }
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Сдаться: "),
                      BlocBuilder<DevEmotionalBloc, DevEmotionalState>(
                        bloc: this._bloc,
                        builder: (context, state) {
                          if (state is DevEmotionalSuccess) {
                            return Text(state
                                .counters.lastUserEmotions!["give_up"]
                                .toString());
                          } else if (state is DevEmotionalInitial) {
                            return Text(state
                                .buttons!.lastUserEmotions!["give_up"]
                                .toString());
                          } else {
                            return Text("Something went wrong");
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Text("БЛЕАТ: "),
                  BlocBuilder<DevEmotionalBloc, DevEmotionalState>(
                    bloc: this._bloc,
                    builder: (context, state) {
                      if (state is DevEmotionalSuccess) {
                        return Text(state.counters.lastUserEmotions!["bleat"]
                            .toString());
                      } else if (state is DevEmotionalInitial) {
                        return Text(state.buttons!.lastUserEmotions!["bleat"]
                            .toString());
                      } else {
                        return Text("Something went wrong");
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget giveUpBuilder(BuildContext context, DevEmotionalState state) {
    if (state is DevEmotionalSuccess) {
      return Text(state.counters.userEmotions!["give_up"].toString());
    } else if (state is DevEmotionalInitial) {
      return Text(state.buttons!.userEmotions!["give_up"].toString());
    } else if (state is DevEmotionalFailed) {
      return Text(state.warning!);
    }
    return Text(ProfileStrings.something_wrong);
  }

  Widget bleatBuilder(BuildContext context, DevEmotionalState state) {
    if (state is DevEmotionalSuccess) {
      return Text(state.counters.userEmotions!["bleat"].toString());
    } else if (state is DevEmotionalInitial) {
      return Text(state.buttons!.userEmotions!["bleat"].toString());
    } else if (state is DevEmotionalFailed) {
      return Text(state.warning!);
    }
    return Text(ProfileStrings.something_wrong);
  }

  Widget suicideBuilder(BuildContext context, DevEmotionalState state) {
    if (state is DevEmotionalSuccess) {
      return Text(state.counters.userEmotions!["suicide"].toString());
    } else if (state is DevEmotionalInitial) {
      return Text(state.buttons!.userEmotions!["suicide"].toString());
    } else if (state is DevEmotionalFailed) {
      return Text(state.warning!);
    }
    return Text(ProfileStrings.something_wrong);
  }
}

class GiveUp extends StatelessWidget {
  final DevEmotionalState state;
  const GiveUp(this.state);

  @override
  Widget build(BuildContext context) {
    if (state is DevEmotionalSuccess) {
      return Text((state as DevEmotionalSuccess)
          .counters
          .lastUserEmotions!["bleat"]
          .toString());
    } else if (state is DevEmotionalInitial) {
      return Text((state as DevEmotionalInitial)
          .buttons!
          .lastUserEmotions!["bleat"]
          .toString());
    } else {
      return Text("Something went wrong");
    }
  }
}
