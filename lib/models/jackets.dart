class Jacket {
  final String name;
  final String price;
  final String imagePath;

  Jacket(this.name, this.price, this.imagePath);
}

final List<Jacket> jackets = [
  Jacket('Street Chill', '\$180.00', 'assets/images/jacket1.jpeg'),
  Jacket('Chic Jacket', '\$145.00', 'assets/images/jacket2.jpeg'),
  Jacket('Classic Jacket', '\$160.00', 'assets/images/jacket3.jpeg'),
];
