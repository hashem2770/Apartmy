import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late TextEditingController nameController;
  late TextEditingController floorsController;
  String? name = '';
  int? floors = 0;

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

//todo: remove displaying of number of floors & name and navigate to adding block
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name??'No name yet',
              style: TextStyle(fontSize: 40),
            ),
            Text(
              floors.toString(),
              style: TextStyle(fontSize: 40),
            ),
            IconButton.outlined(
              iconSize: 40,
              onPressed: () async {
                final nameAndFloors = await onDialog(context);
                if (nameAndFloors == null) return;
                setState(() {
                  this.name = nameAndFloors[0];
                  this.floors = int.parse(nameAndFloors[1]);
                });
              },
              icon: Icon(Icons.home),
            ),
            SizedBox(height: 8),
            Text('Create a new block'),
          ],
        ),
      ),
    );
  }

  Future onDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Create a new block'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                keyboardType: TextInputType.name,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Block Name',
                ),
              ),
              SizedBox(height: 8),
              TextField(
                  keyboardType: TextInputType.number,
                  controller: floorsController,
                  decoration: InputDecoration(
                    hintText: 'Number of floors',
                  )),
            ],
          ),
          actions: [
            TextButton(
              onPressed: submit,
              child: Text('Create'),
            ),
            TextButton(
              onPressed: cancel,
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void submit() {
    Navigator.of(context).pop([nameController.text, floorsController.text]);
    nameController.clear();
    floorsController.clear();
  }

  void cancel() {
    Navigator.of(context).pop();
  }
}
