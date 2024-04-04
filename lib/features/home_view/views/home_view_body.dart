import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
    String? apartmentBuilding;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(apartmentBuilding??'N/V'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                icon: Icon(Icons.apartment),
                title: Text('Create BLOCK'),
                content: TextField(
                  controller: controller,
                  onChanged: (value) {
                    apartmentBuilding = value;
                    setState(() {});
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      //todo: navigate to the details view after taking the user input
                    },
                    child: Text('Ok'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('cancel'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
