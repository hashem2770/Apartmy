import 'package:apartmy/core/utils/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('N/V'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(RoutesNames.addingBlock);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
