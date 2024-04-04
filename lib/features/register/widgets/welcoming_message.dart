import 'package:flutter/material.dart';

class WelcomingMessage extends StatelessWidget {
  final String titleText;
  final String subTitleText;

  const WelcomingMessage({
    super.key,
    required this.titleText,
    required this.subTitleText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          titleText,
          style: TextStyle(
            letterSpacing: 2,
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          subTitleText,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
