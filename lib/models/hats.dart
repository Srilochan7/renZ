class Cap {
  final String name;
  final String price;
  final String imagePath;

  Cap(this.name, this.price, this.imagePath);
}

final List<Cap> caps = [
  Cap('Pleasant Cap', '\$240.32', 'assets/images/cap1.jpeg'),
  Cap('Cool Cap', '\$20.00', 'assets/images/cap2.jpeg'),
  // Cap('Trendy Cap', '\$22.00', 'assets/images/cap3.jpeg'),
];
