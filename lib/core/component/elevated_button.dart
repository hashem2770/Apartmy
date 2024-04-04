import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const CustomButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(60),
        backgroundColor: Colors.black,
        shape: StadiumBorder(),
      ),
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
