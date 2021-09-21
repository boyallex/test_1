import 'package:flutter/material.dart';
import 'package:test_1/bloc/profile_bloc/dev_emotional_bloc.dart';
import 'package:test_1/services/profile_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DevEmotionalBloc _bloc = DevEmotionalBloc(ProfileService());

  @override
  Widget build(BuildContext context) {
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
                this._bloc.mapEventToState(SuicideEvent());2
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
