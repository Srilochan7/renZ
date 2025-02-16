class Watch {
  final String name;
  final String price;
  final String imagePath;

  Watch(this.name, this.price, this.imagePath);
}

final List<Watch> watches = [
  Watch('Elegant Watch', '\$300.00', 'assets/images/watch1.jpeg'),
  Watch('Classic Watch', '\$310.00', 'assets/images/watch2.jpeg'),
  Watch('Digital Watch', '\$350.00', 'assets/images/watch3.jpeg'),
  // Add more watches here
];
