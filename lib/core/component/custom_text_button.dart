import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.label,
    this.onTap,
  });

  final String label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: onTap,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
