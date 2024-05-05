import 'package:apartmy/core/component/custom_text_button.dart';
import 'package:apartmy/features/adding_block_view/widgets/adding_block_view_body.dart';
import 'package:flutter/material.dart';

class AddingBlockView extends StatelessWidget {
  const AddingBlockView({super.key, required this.name, required this.floors});

  final String? name;
  final int? floors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: AddingBlockViewBody(
        name: name,
        floors: floors,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title:  Text('$name'),
      centerTitle: true,
      actions: [
        CustomTextButton(
          label: 'Save',
          onTap: () {
            //todo: save data here and go back
          },
        ),
      ],
    );
  }
}
