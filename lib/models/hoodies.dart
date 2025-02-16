class Hoodie {
  final String name;
  final String price;
  final String imagePath;

  Hoodie(this.name, this.price, this.imagePath);
}

final List<Hoodie> hoodies = [
  Hoodie('True Hoodie', '\$325.36', 'assets/images/hoodie1.jpeg'),
  Hoodie('Warm Hoodie', '\$120.00', 'assets/images/hoodie2.jpeg'),
  Hoodie('Cozy Hoodie', '\$125.00', 'assets/images/hoodie3.jpeg'),
];
