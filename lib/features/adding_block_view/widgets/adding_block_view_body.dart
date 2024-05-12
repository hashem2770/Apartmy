import 'package:flutter/material.dart';

import '../../../models/tenant.dart';

class AddingBlockViewBody extends StatelessWidget {
  const AddingBlockViewBody({super.key, required this.tenantsDetails});

  final List<Tenant> tenantsDetails;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        padding: const EdgeInsets.all(80),
        itemBuilder: (context, index) {
          return Row(
            children: [
              Text(tenantsDetails[index].name),
              SizedBox(width: 20),
              Text(tenantsDetails[index].rent.toString()),
              SizedBox(width: 20),
              Text(tenantsDetails[index].floorsCount.toString()),
            ],
          );
        },
        itemCount: tenantsDetails.length,
      ),
    );
  }
}
