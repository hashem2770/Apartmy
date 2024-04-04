import 'package:flutter/material.dart';

class SignUpBySocialMedia extends StatelessWidget {
  const SignUpBySocialMedia({super.key});

  //todo: add social media icons + implement them

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: Colors.blue,
        ),
        CircleAvatar(
          radius: 32,
          backgroundColor: Colors.redAccent,
        ),
        CircleAvatar(
          radius: 32,
          backgroundColor: Colors.cyan,
        ),
      ]
    );
  }
}
