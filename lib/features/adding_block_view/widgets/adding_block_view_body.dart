import 'package:flutter/material.dart';

import '../../../models/tenant.dart';

class AddingBlockViewBody extends StatelessWidget {
  const AddingBlockViewBody({super.key, required this.tenantsDetails});

  final List<Tenant> tenantsDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: Colors.greenAccent[200],
          margin: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Floor', style: labelStyle()),
              Text('Name', style: labelStyle()),
              Text('Rent', style: labelStyle()),
            ],
          ),
        ),
        SizedBox(height: 18),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tenantsDetails[index].floorsCount.toString(),
                      ),
                      SizedBox(width: 20),
                      Text(
                        tenantsDetails[index].name.toString().toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 20),
                      Text(tenantsDetails[index].rent.toString()),
                    ],
                  ),

                ],
              );
            },
            itemCount: tenantsDetails.length,
          ),
        ),
      ],
    );
  }

  TextStyle labelStyle() {
    return TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
  }
}
