import 'package:flutter/cupertino.dart';

import '../../models/tenant.dart';

class TenantProvider extends ChangeNotifier{
   List<Tenant> tenants = [
    //Tenant(name: 'Test', floorsCount: 0, rent: 0),
  ];

  void addTenant(Tenant tenant) {
   tenants.add(tenant);
    notifyListeners();
  }

  void removeTenant(Tenant tenant) {
    tenants.remove(tenant);
    notifyListeners();
  }

  void resetPaying() {
    tenants.forEach((tenant) {
      tenant.isPayed = false;
    });
    notifyListeners();
  }
}