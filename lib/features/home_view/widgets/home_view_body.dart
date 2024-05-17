import 'package:apartmy/models/tenant.dart';
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
  bool isPayed = true;

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
      // todo: need to refactor the entire app and apply BLoC or Provider
      body: checkTenantInput(Tenant.tenants),
    );
  }

  checkTenantInput(List<Tenant> tenants) {
    if (tenants.isEmpty) {
      return Center(
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
      );
    }
    return buildActiveHomeView(Tenant.tenants);
  }

  Widget buildActiveHomeView(List<Tenant> tenants) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 18),
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: [
              //todo: need to extract this Row into a widget
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tenants[index].floorsCount.toString(),
                    style: TextStyle(
                        decoration: isPayed
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                  SizedBox(width: 20),
                  Text(
                    tenants[index].name.toString().toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: isPayed
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                  SizedBox(width: 20),
                  Text(
                    tenants[index].rent.toString(),
                    style: TextStyle(
                        decoration: isPayed
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                  Checkbox(
                    value: isPayed,
                    onChanged: (value) {
                      if (value == true) {
                        setState(() {
                          isPayed = !isPayed;
                        });
                      }else{
                        setState(() {
                          isPayed = !isPayed;
                        });
                      }
                    },
                  )
                ],
              ),
            ],
          );
        },
        itemCount: tenants.length,
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
                //todo: need to extract this TextFormField into a widget
                TextFormField(
                  // I think it means when you press enter it will hide keyboard
                  onTap: () => FocusScope.of(context).unfocus(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please provide a block name';
                    }
                    // return null if the input is valid
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
                      // make sure the input is a number
                      //however, when I use the PC to test it doesn't work
                      //I know user could never get this error as the keyboard is numbers only
                      final number = int.tryParse(value);
                      if (number == null) {
                        return 'Please provide a valid number';
                      }
                      // return null if the input is valid
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
      context.pushNamed(
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
