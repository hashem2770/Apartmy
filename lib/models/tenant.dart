class Tenant {
  String name;
  int floorsCount;
  num rent;

  Tenant({
    required this.name,
    required this.floorsCount,
    required this.rent,
  });

  static List<Tenant> tenants = [
    //Tenant(name: 'Test', floorsCount: 0, rent: 0),
  ];

}
