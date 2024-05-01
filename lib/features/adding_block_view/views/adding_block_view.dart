import 'package:apartmy/features/adding_block_view/widgets/adding_block_view_body.dart';
import 'package:flutter/material.dart';
class AddingBlockView extends StatelessWidget {
  const AddingBlockView({super.key,required this.name,required this.floors});

  final String? name;
  final int? floors;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: AddingBlockViewBody(name: name,floors: floors),
    );
  }
}
