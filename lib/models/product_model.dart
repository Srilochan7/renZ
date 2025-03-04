class ProductModel {
  final String productId;
  final String name;
  final String description;
  final double price;
  final String category; // E.g., 'Men', 'Women', 'Unisex'
  final String brand;
  final List<String> images; // Multiple image URLs
  final String size; // 'S', 'M', 'L', 'XL' or 'Free Size'
  final String color; // Example: 'Red', 'Black', 'Blue'
  final bool inStock;
  final double rating; // Average rating
  final int totalReviews;
  final List<String> tags; // E.g., ['Casual', 'Winter', 'Streetwear']
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductModel({
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.brand,
    required this.images,
    required this.size,
    required this.color,
    required this.inStock,
    required this.rating,
    required this.totalReviews,
    required this.tags,
    required this.createdAt,
    required this.updatedAt,
  });

  // Convert ProductModel to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'name': name,
      'description': description,
      'price': price,
      'category': category,
      'brand': brand,
      'images': images,
      'size': size,
      'color': color,
      'inStock': inStock,
      'rating': rating,
      'totalReviews': totalReviews,
      'tags': tags,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  // Convert Map to ProductModel
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productId: map['productId'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      category: map['category'] ?? 'Uncategorized',
      brand: map['brand'] ?? 'No Brand',
      images: List<String>.from(map['images'] ?? []),
      size: map['size'] ?? 'Free Size',
      color: map['color'] ?? 'Unknown',
      inStock: map['inStock'] ?? true,
      rating: map['rating']?.toDouble() ?? 0.0,
      totalReviews: map['totalReviews'] ?? 0,
      tags: List<String>.from(map['tags'] ?? []),
      createdAt: DateTime.parse(map['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(map['updatedAt'] ?? DateTime.now().toIso8601String()),
    );
  }
}
