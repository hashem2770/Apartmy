import 'package:flutter/material.dart';

import 'package:apartmy/core/utils/routes_names.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late TextEditingController nameController;
  late TextEditingController floorsController;
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  String? name = '';
  int? floorsCount;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    floorsController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    floorsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton.outlined(
              iconSize: 40,
              onPressed: () async {
                final List? nameAndFloors = await onDialog(context);
                name = nameAndFloors?[0] ?? 'N/V';
                floorsCount = int.tryParse(nameAndFloors?[1] ?? 'N/V');
                setState(() {
                  this.name = name;
                  this.floorsCount = floorsCount;
                });
              },
              icon: Icon(Icons.home),
            ),
            SizedBox(height: 18),
            Text('Create a New Block',
                style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }

  Future<List?> onDialog(BuildContext context) {
    return showDialog<List>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Create a new block'),
          content: Form(
            key: keyForm,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  // I think it means when you press enter it will hide keyboard
                  onTap: () => FocusScope.of(context).unfocus(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please provide a block name';
                    }
                    return null;
                  },
                  controller: nameController,
                  autofocus: true,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: 'Block Name',
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          int.parse(value) <= 1) {
                        return 'Please provide a number of floors';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    controller: floorsController,
                    decoration: InputDecoration(
                      hintText: 'Number of floors',
                    )),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: cancel,
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: create,
              child: Text('Create'),
            ),
          ],
        );
      },
    );
  }

  void create() {
    if (keyForm.currentState!.validate()) {
      Navigator.of(context).pop([nameController.text, floorsController.text]);
      context.goNamed(
        RoutesNames.addingBlock,
        pathParameters: {
          'name': nameController.text,
          'floors': floorsController.text
        },
      );
    }

    nameController.clear();
    floorsController.clear();
  }

  void cancel() {
    Navigator.of(context).pop();
  }
}