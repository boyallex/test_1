import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final Function? onPressed;
  final String picture;
  ProfileButton(this.picture, [this.onPressed]);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => this.onPressed,
      child: Image(
        image: AssetImage(this.picture),
      ),
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
    );
  }
}
