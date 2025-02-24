import 'package:culture/presentation/Screens/checkout/checkout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int pleasantCapQuantity = 2;
  int trueHoodieQuantity = 1;
  
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            children: [
              // Header
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white, size: 6.w),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Text(
                      'CART',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.delaGothicOne(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w200
                        ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 5.w,
                    backgroundImage: NetworkImage(
                      'https://randomuser.me/api/portraits/men/18.jpg'
                    ),
                  )
                ],
              ),
              SizedBox(height: 4.h),
              
              // Cart Items
              CartItem(
                image: 'assets/images/image1.jpeg',
                title: 'PLEASANT CAP',
                price: 240.32,
                size: 'Large',
                quantity: pleasantCapQuantity,
                onIncrease: () {
                  setState(() => pleasantCapQuantity++);
                },
                onDecrease: () {
                  if (pleasantCapQuantity > 1) {
                    setState(() => pleasantCapQuantity--);
                  }
                },
              ),
              SizedBox(height: 2.h),
              CartItem(
                image: 'assets/images/glasses.jpeg',
                title: 'TRUE HOODIE',
                price: 325.36,
                size: 'Medium',
                quantity: trueHoodieQuantity,
                onIncrease: () {
                  setState(() => trueHoodieQuantity++);
                },
                onDecrease: () {
                  if (trueHoodieQuantity > 1) {
                    setState(() => trueHoodieQuantity--);
                  }
                },
              ),
              SizedBox(height: 2.h),
              CartItem(
                image: 'assets/images/caps2.jpeg',
                title: 'Trendy Cap',
                price: 22.00,
                size: 'Medium',
                quantity: trueHoodieQuantity,
                onIncrease: () {
                  setState(() => trueHoodieQuantity++);
                },
                onDecrease: () {
                  if (trueHoodieQuantity > 1) {
                    setState(() => trueHoodieQuantity--);
                  }
                },
              ),
              
              Spacer(),
              
              // Summary
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sub Total',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 18.sp,
                        ),
                      ),
                      Text(
                        '\$565.68',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shipping Fee',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 18.sp,
                        ),
                      ),
                      Text(
                        '\$20.00',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                  Divider(color: Colors.grey, height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                        ),
                      ),
                      Text(
                        '\$585.68',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              
              SizedBox(height: 3.h),
              
              // Checkout Button
              Container(
                  width: 90.w,
                  height: 6.h,
                  margin: EdgeInsets.only(bottom: 3.h),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3D3D3B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Checkout()));
                    },
                    child: Text(
                      'Continue to Checkout',
                      style: GoogleFonts.delaGothicOne(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w200
                        ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
        );}
    );
  }
}

class CartItem extends StatelessWidget {
  final String image;
  final String title;
  final double price;
  final String size;
  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CartItem({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.size,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(3.w),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(2.w),
            child: Image.asset(
              image,
              width: 20.w,
              height: 20.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 4.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  'Size: $size',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove, color: Colors.white, size: 5.w),
                onPressed: onDecrease,
              ),
              Text(
                quantity.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                ),
              ),
              IconButton(
                icon: Icon(Icons.add, color: Colors.white, size: 5.w),
                onPressed: onIncrease,
              ),
            ],
          ),
        ],
      ),
    );
  }
}