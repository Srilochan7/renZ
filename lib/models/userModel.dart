import 'package:culture/models/orderModel.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String profilePic;
  final String address;
  final List<String> wishList; // List of product IDs
  final List<String> cart; // List of product IDs
  final List<OrderModel> orderHistory; // List of orders
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.profilePic,
    required this.address,
    required this.wishList,
    required this.cart,
    required this.orderHistory,
    required this.createdAt,
    required this.updatedAt,
  });

  // Convert a UserModel instance to a Map for Firebase Firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'profilePic': profilePic,
      'address': address,
      'wishList': wishList,
      'cart': cart,
      'orderHistory': orderHistory.map((order) => order.toMap()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  // Convert a Map to a UserModel instance
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      profilePic: map['profilePic'] ?? '',
      address: map['address'] ?? '',
      wishList: List<String>.from(map['wishList'] ?? []),
      cart: List<String>.from(map['cart'] ?? []),
      orderHistory: (map['orderHistory'] as List<dynamic>?)
              ?.map((order) => OrderModel.fromMap(order))
              .toList() ??
          [],
      createdAt: DateTime.parse(map['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(map['updatedAt'] ?? DateTime.now().toIso8601String()),
    );
  }
}
