
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sizer/sizer.dart';
import 'package:culture/presentation/widgets/category_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedCategory = "Shirts";

  final List<Map<String, dynamic>> categories = [
    {"label": "Jackets", "icon": FontAwesomeIcons.shirtsinbulk}, // Font Awesome's "jacket" icon
  {"label": "Shoes", "icon": FontAwesomeIcons.shoePrints}, // Font Awesome's "shoePrints" icon (there's no direct 'shoes' icon)
  {"label": "Caps", "icon": Icons.account_circle}, // Material icon for a person's face (you can also use other alternatives like 'sports_esports' if relevant)
  {"label": "Watches", "icon": Icons.watch}, // Material "watch" icon
  {"label": "Hoodies", "icon": Icons.access_alarm}, // Material "access_alarm" can resemble a hoodie (use an alternative like "sports_score" if you want a better fit)
  {"label": "Shirts", "icon": Icons.checkroom}, // Material "checkroom" icon fits for shirts
  {"label": "Pants", "icon": Icons.directions_walk}, // Material "directions_walk" icon can resemble pants or walking
  {"label": "Bags", "icon": Icons.luggage}, 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.grid_view, color: Colors.white),
                    CircleAvatar(
                      radius: 5.w,
                      backgroundImage: NetworkImage(
                          'https://randomuser.me/api/portraits/men/18.jpg'),
                    )
                  ],
                ),
                SizedBox(height: 2.h),
                Text(
                  'BE DIFFERENT',
                  style: GoogleFonts.zenDots(
                    color: Colors.grey,
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  'Gen Z : Trend\nTrade and Transform',
                  style: GoogleFonts.delaGothicOne(
                    color: Colors.white,
                    fontSize: 21.sp,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                 'Drip without the commitment—buy or sell the hottest Gen Z fashion. Stay fresh, stay RenZ!',
                  style: GoogleFonts.zenDots(
                    color: Colors.grey,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  'New Drips😎',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2.h),
                Center(
                  child: Container(
                    height: 30.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/ld.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  'Trending now 🔥',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (final image in ['t1.jpg', 't2.jpg', 't3.jpg'])
                      Container(
                        height: 30.h,
                        width: 28.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/$image',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.redAccent.withOpacity(0.3),
                                child: const Center(
                                  child: Text('Image Error',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 3.h),
                Text(
                  'Thrift Vault 🔥',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Container(
                      height: 35.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/tr1.jpg',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.redAccent.withOpacity(0.3),
                              child: const Center(
                                child: Text('Image Error',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Column(
                      children: [
                        Container(
                          height: 19.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/tr2.jpg',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.redAccent.withOpacity(0.3),
                                  child: const Center(
                                    child: Text('Image Error',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Container(
                          height: 14.5.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/tr3.jpg',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.redAccent.withOpacity(0.3),
                                  child: const Center(
                                    child: Text('Image Error',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                Text(
                  'Drip Check👟',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2.h),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 2.h,
                  crossAxisSpacing: 1.w,
                  childAspectRatio: 3,
                  children: categories.map((category) {
                    return CategoryButton(
                      label: category['label'],
                      icon: category['icon'],
                      isSelected: selectedCategory == category['label'],
                      onTap: () {
                        setState(() {
                          selectedCategory = category['label'];
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}