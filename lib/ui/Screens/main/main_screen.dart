import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_1/assets/strings.dart';
import 'package:test_1/bloc/profile_bloc/dev_emotional_bloc.dart';
import 'package:test_1/services/hive_service.dart';
import 'package:test_1/services/profile_service.dart';
import 'package:test_1/ui/Screens/main/profile_button.dart';

class MainScreen extends StatelessWidget {
  MainScreen();
  final DevEmotionalBloc _bloc = DevEmotionalBloc(ProfileService());

  @override
  Widget build(BuildContext context) {
    this._bloc.add(DevEmotionalStarted());

    return BlocListener<DevEmotionalBloc, DevEmotionalState>(
      bloc: this._bloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(
            children: [
              ProfileButton('images/suicide.jpg', () {
                _bloc.add(SuicideEvent());
              }),
              SizedBox(
                child: Center(
                  child: BlocBuilder<DevEmotionalBloc, DevEmotionalState>(
                    bloc: this._bloc,
                    builder: (context, state) {
                      if (state is DevEmotionalSuicideSuccess) {
                        return Text(state.counter.toString());
                      } else if (state is DevEmotionalInitial) {
                        return Text(state.buttons!["suicide"].toString());
                      } else if (state is DevEmotionalFailed) {
                        return Text(state.warning!);
                      }
                      return Text(ProfileStrings.something_wrong);
                    },
                  ),
                ),
                height: 30,
              ),
              ProfileButton('images/give_up.jpg', () {
                _bloc.add(GiveUpEvent());
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
                _bloc.add(BleatEvent());
              }),
              SizedBox(
                child: Center(
                  child: BlocBuilder<DevEmotionalBloc, DevEmotionalState>(
                    bloc: this._bloc,
                    builder: bleatBuilder,
                  ),
                ),
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget giveUpBuilder(BuildContext context, DevEmotionalState state) {
    if (state is DevEmotionalGiveUpSuccess) {
      return Text(state.counter.toString());
    } else if (state is DevEmotionalInitial) {
      return Text(state.buttons!["give_up"].toString());
    } else if (state is DevEmotionalFailed) {
      return Text(state.warning!);
    }
    return Text(ProfileStrings.something_wrong);
  }

  Widget bleatBuilder(BuildContext context, DevEmotionalState state) {
    if (state is DevEmotionalBleatSuccess) {
      return Text(state.counter.toString());
    } else if (state is DevEmotionalInitial) {
      return Text(state.buttons!["bleat"].toString());
    } else if (state is DevEmotionalFailed) {
      return Text(state.warning!);
    }
    return Text(ProfileStrings.something_wrong);
  }

  Widget suicideBuilder(BuildContext context, DevEmotionalState state) {
    if (state is DevEmotionalSuicideSuccess) {
      return Text(state.counter.toString());
    } else if (state is DevEmotionalInitial) {
      return Text(state.buttons!["suicide"].toString());
    } else if (state is DevEmotionalFailed) {
      return Text(state.warning!);
    }
    return Text(ProfileStrings.something_wrong);
  }
}
