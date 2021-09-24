import 'package:flutter/material.dart';
import 'package:test_1/bloc/profile_bloc/dev_emotional_bloc.dart';
import 'package:test_1/services/hive_service.dart';
import 'package:test_1/services/profile_service.dart';


class MainScreen extends StatelessWidget {
  MainScreen();  
  DevEmotionalBloc _bloc = DevEmotionalBloc();
  @override
  Widget build(BuildContext context) {
    print(HiveFile().read().toString());
    return Scaffold(
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
                _bloc.mapEventToState(SuicideEvent());
              },
              child: Image(
                image: AssetImage('images/give_up.jpg'),
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
    );
  }
}
