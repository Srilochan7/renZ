// import 'package:culture/ui/Screens/cart.dart';
// import 'package:culture/models/all_products.dart';
// import 'package:culture/ui/widgets/bottom_navbar.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:sizer/sizer.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   String selectedCategory = 'All';
//   //  int _selectedIndex = 0;
//   //   void _onItemTapped(int index) {
//   //   setState(() {
//   //     _selectedIndex = index;
//   //   });

//     // // Navigate to CartPage when shopping bag icon (index 2) is tapped
//     // if (index == 2) {
//     //   Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Cart()));
//     // }
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return Sizer(
//       builder: (context, orientation, deviceType) {
//         return Scaffold(
//             backgroundColor: Colors.black,
//             body: SafeArea(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: EdgeInsets.all(4.w),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Icon(Icons.grid_view, color: Colors.white),
//                           CircleAvatar(
//                             radius: 5.w,
//                             backgroundImage: NetworkImage(
//                                 'https://randomuser.me/api/portraits/men/18.jpg'),
//                           )
//                         ],
//                       ),
//                       SizedBox(height: 2.h),
//                       Text(
//                         'BE DIFFERENT',
//                         style: GoogleFonts.zenDots(
//                           color: Colors.grey,
//                           fontSize: 12.sp,
//                         ),
//                       ),
//                       Text(
//                         'POPULAR\nPRODUCTS',
//                         style: GoogleFonts.delaGothicOne(
//                           color: Colors.white,
//                           fontSize: 24.sp,
//                           fontWeight: FontWeight.w200
//                         ),
//                       ),
//                       SizedBox(height: 2.h),
//                       Text(
//                         'Drip without the commitment—buy, sell, or rent the hottest Gen Z fashion. Stay fresh, stay RenZ!:',
//                           style: GoogleFonts.zenDots(
//                           color: Colors.grey,
//                           fontSize: 12.sp,
//                         ),
//                       ),
//                       SizedBox(height: 2.h),                                                 
//                       //  _buildCoverImage(),
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children: [
//                             _buildCategoryChip('All'),
//                             _buildCategoryChip('Hoodies'),
//                             _buildCategoryChip('Sneakers'),
//                             _buildCategoryChip('Jackets'),
//                             _buildCategoryChip('Hats'),
//                              _buildCategoryChip('Watches'),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 4.h),
                      
//                           GridView.builder(
//                             shrinkWrap: true,
//                             physics: NeverScrollableScrollPhysics(),
//                             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 2,
//                               childAspectRatio: 0.7,
//                               mainAxisSpacing: 4.w,
//                               crossAxisSpacing: 4.w,
//                             ),
//                             itemCount: products.length,
//                             itemBuilder: (context, index) {
//                               return _buildProductCard(
//                                 products[index].name,
//                                 products[index].price,
//                                 products[index].imagePath,
//                               );
//                             },
//                           ),


//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             bottomNavigationBar: BottomNavbar(),
      
//       );
//       },
//     );
//   }

//   Widget _buildCategoryChip(String label) {
//     bool isSelected = selectedCategory == label;
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedCategory = label;
//         });
//       },
//       child: SingleChildScrollView(
//         child: Container(
//           margin: EdgeInsets.only(right: 3.w),
//           padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.w),
//           decoration: BoxDecoration(
//             color: isSelected ? Colors.white : Colors.transparent,
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(
//               color: isSelected ? Colors.transparent : Colors.grey[800]!,
//               width: 1,
//             ),
//           ),
//           child: Text(
//             label,
//             style: GoogleFonts.zenDots(
//               color: isSelected ? Colors.black : Colors.white,
//               fontSize: 15.sp,
//               fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



// Widget _buildProductCard(String name, String price, String imagePath) {
//   return Container(
//     decoration: BoxDecoration(
//       color: Colors.grey[900],
//       borderRadius: BorderRadius.circular(4.w),
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           child: ClipRRect(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(4.w)),
//             child: Image.asset(
//               imagePath,
//               fit: BoxFit.cover,
//               width: double.infinity,
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.all(2.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 name,
//                 style:
//                     GoogleFonts.poppins(color: Colors.white, fontSize: 12.sp),
//               ),
//               Text(
//                 price,
//                 style: GoogleFonts.poppins(
//                     color: Colors.white,
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
//  Widget _buildCoverImage() {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 3.h),
//       width: double.infinity,
//       height: 30.h,  // Adjust this value to make the image larger or smaller
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(4.w),
//         image: DecorationImage(
//           image: AssetImage('assets/images/cover.jpeg'),
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }





  import 'package:culture/ui/Screens/cart.dart';
  import 'package:culture/models/all_products.dart';
  import 'package:culture/ui/widgets/bottom_navbar.dart';
  import 'package:flutter/material.dart';
  import 'package:google_fonts/google_fonts.dart';
  import 'package:page_transition/page_transition.dart';
  import 'package:sizer/sizer.dart';

  class Home extends StatefulWidget {
    const Home({super.key});

    @override
    State<Home> createState() => _HomeState();
  }

  class _HomeState extends State<Home> {
    String selectedCategory = 'All';
    //  int _selectedIndex = 0;
    //   void _onItemTapped(int index) {
    //   setState(() {
    //     _selectedIndex = index;
    //   });

      // // Navigate to CartPage when shopping bag icon (index 2) is tapped
      // if (index == 2) {
      //   Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Cart()));
      // }
    // }
    @override
    Widget build(BuildContext context) {
      return Sizer(
        builder: (context, orientation, deviceType) {
          return Scaffold(
              backgroundColor: Colors.black,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(4.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          'ren Z : Trend\nTrade and Turn',
                          style: GoogleFonts.delaGothicOne(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w200
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'Drip without the commitment—buy, sell, or rent the hottest Gen Z fashion. Stay fresh, stay RenZ!:',
                            style: GoogleFonts.zenDots(
                            color: Colors.grey,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(height: 2.h), 

                        Text(
                          'New Drips',
                          style: GoogleFonts.delaGothicOne(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w200
                          ),
                        ),                                                
                        
                      Center(
                        child: Container(
                        height: 30.h,  // Adjust height
                        width: 80.w,   // Adjust width to make it rectangular
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), // Optional rounded corners
                          image: DecorationImage(
                            image: AssetImage('assets/images/ld.jpg'), // Corrected way to use AssetImage
                            fit: BoxFit.cover, // Adjust image fit
                          ),
                        ),
                                          ),
                      ),

                        


                      ],
                    ),
                  ),
                ),
              ),
              // bottomNavigationBar: BottomNavbar(),
        
        );
        },
      );
    }

  }






