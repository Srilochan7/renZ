import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart'; // Add this import

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 5.h,
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          controller: _searchController,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 12.sp,
          ),
          decoration: InputDecoration(
            hintText: 'Get your drip...',
            hintStyle: GoogleFonts.poppins(
              color: Colors.grey,
              fontSize: 15.sp,
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 2.w,
              vertical: 1.h,
            ),
          ),
        ),
      ),
    );
  }
}
