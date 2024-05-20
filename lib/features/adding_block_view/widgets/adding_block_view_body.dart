import 'package:apartmy/features/managers/tenants_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/tenant.dart';

class AddingBlockViewBody extends StatelessWidget {
  const AddingBlockViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TenantProvider>(builder:
        (BuildContext context, TenantProvider tenantsProvider, Widget? child) {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            color: Colors.greenAccent[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Floor', style: labelStyle()),
                Text('Name', style: labelStyle()),
                Text('Rent', style: labelStyle()),
                //just to adjust the space
                Container(),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                // todo: try display tenants in ascending order
                var sortedTenants =  tenantsProvider.tenants.sort(
                  (a, b) => a.floorsCount.compareTo(b.floorsCount),
                );
                Tenant tenant = tenantsProvider.tenants[index];
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          tenant.floorsCount.toString(),
                        ),
                        SizedBox(width: 20),
                        Text(
                          tenant.name.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 20),
                        Text(tenant.rent.toString()),
                        IconButton(
                          onPressed: () {
                            tenantsProvider.removeTenant(tenant);
                          },
                          icon: Icon(Icons.delete),
                          color: Colors.red[400],
                        )
                      ],
                    ),
                  ],
                );
              },
              itemCount: tenantsProvider.tenants.length,
            ),
          ),
        ],
      );
    });
  }

  TextStyle labelStyle() {
    return TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
  }
}
