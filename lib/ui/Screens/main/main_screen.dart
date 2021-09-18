import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
              onPressed: () {},
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
