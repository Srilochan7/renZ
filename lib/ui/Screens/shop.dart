import 'package:culture/ui/widgets/product_card.dart';
import 'package:culture/ui/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

// No changes needed to your Shop widget - it's already correctly importing
// and using ProductCard widget from the separate file

// Just to ensure your product list is consistent and flexible:
List<Map<String, dynamic>> products = [
  {
    'image': 'assets/images/caps1.jpeg',
    'price': 240.32,
    'title': 'Pleasant Cap',
    'isFavorite': false,
  },
  {
    'image': 'assets/images/hoodie1.jpeg',
    'price': 340.50,
    'title': 'Winter Hoodie',
    'isFavorite': false,
  },
  {
    'image': 'assets/images/sneakers1.jpeg',
    'price': 180.99,
    'title': 'Urban Sneakers',
    'isFavorite': false,
  },
  {
    'image': 'assets/images/watch.jpeg',
    'price': 299.99,
    'title': 'Smart Watch',
    'isFavorite': false,
  },
];

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  String selectedCategory = 'All'; // Default selected category
  final categories = ['All', 'Caps', 'Hoodies', 'Shoes', 'Accessories'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with back button, search field, and filter
              Padding(
  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),  // Adjusted vertical padding
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
      // Search Field - expands to fill available space
      Expanded(child: SearchField()),
      SizedBox(width: 2.w),
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

// Category Horizontal Scrolling List
Container(
  height: 5.h,
  margin: EdgeInsets.symmetric(vertical: 1.h),  // Adjusted vertical margin
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    padding: EdgeInsets.symmetric(horizontal: 4.w),
    itemCount: categories.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.only(right: 2.w),
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedCategory = categories[index];
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            decoration: BoxDecoration(
              color: selectedCategory == categories[index]
                  ? Colors.white
                  : Colors.grey[900],
              borderRadius: BorderRadius.circular(25),
            ),
            alignment: Alignment.center,
            child: Text(
              categories[index],
              style: GoogleFonts.poppins(
                color: selectedCategory == categories[index]
                    ? Colors.black
                    : Colors.white,
                fontWeight: selectedCategory == categories[index]
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ),
        ),
      );
    },
  ),
),

              
              SizedBox(height: 1.h),
              
              // Products Grid - Using the ProductCard widget from product_card.dart
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 5.w,
                    mainAxisSpacing: 5.w,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(productData: products[index], index: index);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 5.w,
                    mainAxisSpacing: 5.w,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(productData: products[index], index: index);
                  },
                ),
              ),
              
              SizedBox(height: 3.h),
            ],
          ),
        ),
      ),
    );
  }
}