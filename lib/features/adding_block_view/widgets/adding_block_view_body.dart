import 'package:flutter/material.dart';

class AddingBlockViewBody extends StatelessWidget {
  const AddingBlockViewBody({super.key,required this.name,required this.floors});

  final String? name;
  final int? floors;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(name ?? 'N/V'),
          Text('${floors ?? 'N/V'} '),
        ],
      ),
    );
  }
}
