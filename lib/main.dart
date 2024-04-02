import 'package:apartmy/features/splash_view/views/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Apartmy());

}

class Apartmy extends StatelessWidget {
  const Apartmy({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apartmy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashView(),
    );
  }
}
