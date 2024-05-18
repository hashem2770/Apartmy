class Tenant {
  String name;
  int floorsCount;
  num rent;
  bool isPayed = false;

  Tenant({
    required this.name,
    required this.floorsCount,
    required this.rent,
    required this.isPayed,
  });

  static List<Tenant> tenants = [
    //Tenant(name: 'Test', floorsCount: 0, rent: 0),
  ];

}
