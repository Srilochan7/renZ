class OrderModel {
  final String orderId;
  final List<String> products; // List of product IDs
  final double totalAmount;
  final String status; // e.g., pending, shipped, delivered
  final DateTime orderDate;
  final String paymentMethod;

  OrderModel({
    required this.orderId,
    required this.products,
    required this.totalAmount,
    required this.status,
    required this.orderDate,
    required this.paymentMethod,
  });

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'products': products,
      'totalAmount': totalAmount,
      'status': status,
      'orderDate': orderDate.toIso8601String(),
      'paymentMethod': paymentMethod,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderId: map['orderId'] ?? '',
      products: List<String>.from(map['products'] ?? []),
      totalAmount: map['totalAmount']?.toDouble() ?? 0.0,
      status: map['status'] ?? 'pending',
      orderDate: DateTime.parse(map['orderDate'] ?? DateTime.now().toIso8601String()),
      paymentMethod: map['paymentMethod'] ?? 'COD',
    );
  }
}
