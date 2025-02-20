class Sneaker {
  final String name;
  final String price;
  final String imagePath;

  Sneaker(this.name, this.price, this.imagePath);
}

final List<Sneaker> sneakers = [
  Sneaker('Cool Sneakers', '\$200.00', 'assets/images/sneaker1.jpeg'),
  Sneaker('Sporty Sneakers', '\$190.00', 'assets/images/sneaker2.jpeg'),
  Sneaker('Premium Sneakers', '\$200.00', 'assets/images/sneaker3.jpeg'),
];
