import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> uploadProducts() async {
    List<Map<String, dynamic>> products = [
  {"name": "Pleasant Cap", "price": 240.32, "imageUrl": "assets/images/image1.jpeg"},
  {"name": "True Hoodie", "price": 325.36, "imageUrl": "assets/images/image2.jpeg"},
  {"name": "Luxe Vision", "price": 125.00, "imageUrl": "assets/images/glasses.jpeg"},
  {"name": "Cozy Vibe", "price": 150.00, "imageUrl": "assets/images/images3.jpeg"},
  {"name": "Street Chill", "price": 180.00, "imageUrl": "assets/images/jacket2.jpeg"},
  {"name": "Cool sneakers", "price": 200.00, "imageUrl": "assets/images/shoes.jpeg"},
  {"name": "Elegant Watch", "price": 300.00, "imageUrl": "assets/images/watch.jpeg"},
  {"name": "Trendy Hoodie", "price": 130.00, "imageUrl": "assets/images/jacket3.jpeg"},
  {"name": "Chic Jacket", "price": 145.00, "imageUrl": "assets/images/jacket4.jpeg"},
  {"name": "Classic Jacket", "price": 160.00, "imageUrl": "assets/images/jacket5.jpeg"},
  {"name": "Sporty Sneakers", "price": 190.00, "imageUrl": "assets/images/sneakers1.jpeg"},
  {"name": "Fashion Sneakers", "price": 185.00, "imageUrl": "assets/images/sneakers2.jpeg"},
  {"name": "Casual Sneakers", "price": 170.00, "imageUrl": "assets/images/sneakers3.jpeg"},
  {"name": "Premium Sneakers", "price": 200.00, "imageUrl": "assets/images/sneakers4.jpeg"},
  {"name": "Luxury Sneakers", "price": 220.00, "imageUrl": "assets/images/sneakers5.jpeg"},
  {"name": "Smart Watch", "price": 300.00, "imageUrl": "assets/images/watch1.jpeg"},
  {"name": "Classic Watch", "price": 310.00, "imageUrl": "assets/images/watch2.jpeg"},
  {"name": "Digital Watch", "price": 350.00, "imageUrl": "assets/images/watch3.jpeg"},
  {"name": "Luxury Watch", "price": 400.00, "imageUrl": "assets/images/watch4.jpeg"},
  {"name": "Smart Casual Watch", "price": 380.00, "imageUrl": "assets/images/watch5.jpeg"},
  {"name": "Warm Hoodie", "price": 120.00, "imageUrl": "assets/images/hoodie1.jpeg"},
  {"name": "Cozy Hoodie", "price": 125.00, "imageUrl": "assets/images/hoodie2.jpeg"},
  {"name": "Chic Hoodie", "price": 130.00, "imageUrl": "assets/images/hoodie3.jpeg"},
  {"name": "Classic Hoodie", "price": 135.00, "imageUrl": "assets/images/hoodie4.jpeg"},
  {"name": "Stylish Hoodie", "price": 140.00, "imageUrl": "assets/images/hoodie5.jpeg"},
  {"name": "Cool Cap", "price": 20.00, "imageUrl": "assets/images/caps1.jpeg"},
  {"name": "Trendy Cap", "price": 22.00, "imageUrl": "assets/images/caps2.jpeg"},
];


    for (var product in products) {
      await _firestore.collection("products").add(product);
    }
  }
}
