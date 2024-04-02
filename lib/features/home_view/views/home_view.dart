import 'package:flutter/material.dart';
import 'package:apartmy/features/home_view/views/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body:const HomeViewBody()
    );
  }
}
