import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_1/assets/strings.dart';
import 'package:test_1/bloc/profile_bloc/dev_emotional_bloc.dart';
import 'package:test_1/services/hive_service.dart';

class MainScreen extends StatelessWidget {
  MainScreen();
  final DevEmotionalBloc _bloc = DevEmotionalBloc();
  @override
  Widget build(BuildContext context) {
    this._bloc.add(DevEmotionalStarted());
    print(HiveFile().read().toString());

    late int? suicide_count;
    late int? give_up_count;
    late int? bleat_count;

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
              ElevatedButton(
                onPressed: () {},
                child: Image(
                  image: AssetImage('images/suicide.jpg'),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shadowColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
              SizedBox(
                child: Center(
                  child: Text("Вот эта жоска"),
                ),
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  print(1);
                  _bloc.add(GiveUpEvent());
                },
                child: Image(
                  image: AssetImage('images/give_up.jpg'),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
              ),
              SizedBox(
                child: Center(
                  child: BlocBuilder<DevEmotionalBloc, DevEmotionalState>(
                    bloc: this._bloc,
                    builder: (context, state) {
                      if (state is DevEmotionalGiveUpSuccess) {
                        give_up_count = state.counter;
                        return Text(give_up_count.toString());
                      }
                      else if (state is DevEmotionalInitial) {
                        
                      }
                       else if (state is DevEmotionalFailed) {
                        return Text(state.warning!);
                      }
                      return Text(ProfileStrings.something_wrong);
                    },
                  ),
                ),
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Image(
                  image: AssetImage('images/bleat.jpg'),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
              ),
              SizedBox(
                child: Center(
                  child: Text("Вот эта жоска"),
                ),
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
