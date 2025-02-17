import 'package:culture/ui/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}
final List<Map<String, dynamic>> products = [
  {
    'image': 'assets/images/caps1.jpeg',
    'price': 240.32,
    'title': 'Pleasant Cap',
  },
  {
    'image': 'assets/images/hoodie1.jpeg',
    'price': 340.50,
    'title': 'Winter Hoodie',
  },
  {
    'image': 'assets/images/sneakers1.jpeg',
    'price': 180.99,
    'title': 'Urban Sneakers',
  },
  {
    'image': 'assets/images/watch.jpeg',
    'price': 299.99,
    'title': 'Smart Watch',
  },
];

class _ShopState extends State<Shop> {
  String selectedCategory = 'All'; // Default selected category

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
                child: Row(
                  children: [
                    // Back Button
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                    // Search Field
                    SearchField(),
                    // Filters Button
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        onPressed: () {
                          // Add filter functionality here
                        },
                        icon: const Icon(
                          Icons.tune,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Category Buttons
             Row(
              children: [
                ElevatedButton(onPressed: (){

                }, child: Text("buy"))
              ],
             ),
             SizedBox(height: 3.h,),
             Padding(
  padding: EdgeInsets.symmetric(horizontal: 4.w),
  child: GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.7,
      crossAxisSpacing: 3.w,
      mainAxisSpacing: 3.w,
    ),
    itemCount: 4, // Show only 4 products
    itemBuilder: (context, index) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Product Image
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset(
                    products[index]['image'],
                    width: double.infinity,
                    height: 25.h,
                    fit: BoxFit.cover,
                  ),
                ),
                // Wishlist Heart Icon
                Positioned(
                  top: 2.h,
                  right: 2.w,
                  child: Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 18.sp,
                    ),
                  ),
                ),
              ],
            ),
            // Price and Title
            Padding(
              padding: EdgeInsets.all(3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$${products[index]['price'].toStringAsFixed(2)}',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    products[index]['title'],
                    style: GoogleFonts.poppins(
                      color: Colors.grey[400],
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  ),
),
            ],
          ),
        ),
      ),
    );
  }

  // Category Button Widget with state change on click
  
}
