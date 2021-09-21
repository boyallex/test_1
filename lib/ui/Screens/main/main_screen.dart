import 'package:flutter/material.dart';
import 'package:test_1/bloc/profile_bloc/dev_emotional_bloc.dart';
import 'package:test_1/services/profile_service.dart';


class MainScreen extends StatelessWidget {
  final String? uid;
  MainScreen({this.uid});  

  @override
  Widget build(BuildContext context) {
    DevEmotionalBloc _bloc = DevEmotionalBloc(ProfileService(), this.uid);
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
