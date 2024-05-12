import 'package:apartmy/core/component/custom_text_button.dart';
import 'package:apartmy/features/adding_block_view/widgets/adding_block_view_body.dart';
import 'package:apartmy/models/tenant.dart';
import 'package:flutter/material.dart';

class AddingBlockView extends StatefulWidget {
  const AddingBlockView({super.key, required this.name, required this.floors});

  final String name;
  final int floors;

  @override
  State<AddingBlockView> createState() => _AddingBlockViewState();
}

class _AddingBlockViewState extends State<AddingBlockView> {
  // todo: save details in List and pass it bodyView to display it
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController rentController;
  List<Tenant> tenants = [
    Tenant(name: 'Test', floorsCount: 0, rent: 0),
  ];
  String? name = '';
  int floorsCount = 0;

  List<DropdownMenuEntry> createFloors(int floors) {
    List<DropdownMenuEntry> floorsCount = [];
    for (int i = 1; i < floors; i++) {
      floorsCount.add(DropdownMenuEntry(
        label: 'Floor $i',
        value: i,
      ));
    }
    return floorsCount;
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    rentController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    rentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: AddingBlockViewBody(
        tenantsDetails: tenants,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
           await onDialog(context);
          // I don't know what this line suppose to do but it works
          //name = tenantsDetails?[0] ?? 'N/V';
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('${widget.name}'),
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

  Future<List?> onDialog(BuildContext context) {
    return showDialog<List>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Create a New Tenant'),
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
                      return 'Please provide a tenant name';
                    }
                    // return null if the input is valid
                    return null;
                  },
                  controller: nameController,
                  autofocus: true,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: 'Tenant Name',
                  ),
                ),
                SizedBox(height: 12),
                TextFormField(
                  // I think it means when you press enter it will hide keyboard
                  onTap: () => FocusScope.of(context).unfocus(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please provide a tenant rent';
                    }
                    // return null if the input is valid
                    return null;
                  },
                  controller: rentController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: 'Rent',
                  ),
                ),
                SizedBox(height: 24),
                DropdownMenu(
                  hintText: 'Floor Number',
                  onSelected: (value) {
                    setState(() {
                      floorsCount = value;
                    });

                    print(value);
                  },
                  dropdownMenuEntries: createFloors(widget.floors + 1),
                ),
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
      tenants.add(
        Tenant(
          name: nameController.text,
          floorsCount: floorsCount,
          rent: int.parse(rentController.text),
        ),
      );
    }

    nameController.clear();
    rentController.clear();
    setState(() {});
    Navigator.of(context).pop();
  }

  void cancel() {
    Navigator.of(context).pop();
  }
}
