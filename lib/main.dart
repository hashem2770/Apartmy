import 'package:flutter/material.dart';
import 'package:apartmy/features/home_view/views/home_view.dart';

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
      home: const HomeView(),
    );
  }
}
