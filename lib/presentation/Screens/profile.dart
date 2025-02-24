import 'package:culture/logic/blocs/auth/bloc/auth_bloc.dart';
import 'package:culture/presentation/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  void _onMenuItemPressed(BuildContext context, String title) {
    switch (title) {
      case 'Your profile':
        break;
      case 'Payment Methods':
        break;
      case 'My Orders':
        // Navigate to Orders Page
        break;
      case 'Settings':
        // Navigate to Settings Page
        break;
      case 'Help Center':
        // Navigate to Help Center
        break;
      case 'Privacy Policy':
        // Navigate to Privacy Policy Page
        break;
      case 'Log out':
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    backgroundColor: Colors.black,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Are you sure you want to log out?",
              style: GoogleFonts.delaGothicOne(
                              color: const Color.fromARGB(255, 199, 199, 199),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w200),
              textAlign: TextAlign.center,
            
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Close BottomSheet
                    context.read<AuthBloc>().add(AuthLogoutRequested()); // Log out
                  },
                  child: Text("Yes", style: GoogleFonts.poppins(color: Colors.white)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                  ),
                  onPressed: () => Navigator.pop(context), // Close BottomSheet
                  child: Text("No", style: GoogleFonts.poppins(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
  break;



    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
      print("User logged out successfully");  // Debugging

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "You have been logged out",
            style: GoogleFonts.poppins(),
          ),
          duration: Duration(seconds: 2),
        ),
      );

      // ✅ Navigate to Login Page (Update the route accordingly)
      Future.delayed(Duration(milliseconds: 500), () {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);
      });
    }
      },
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 5.h),
                  // Profile Section
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 15.w,
                              backgroundImage: const NetworkImage(
                                'https://randomuser.me/api/portraits/men/18.jpg',
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(1.w),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.edit,
                                  size: 3.w,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'Super man',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Menu Items (Separated for Scalability)
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      children: [
                        _menuItem(
                          context,
                          icon: Icons.person_outline,
                          title: 'Your profile',
                        ),
                        _menuItem(
                          context,
                          icon: Icons.payment,
                          title: 'Payment Methods',
                        ),
                        _menuItem(
                          context,
                          icon: Icons.shopping_bag_outlined,
                          title: 'My Orders',
                        ),
                        _menuItem(
                          context,
                          icon: Icons.settings_outlined,
                          title: 'Settings',
                        ),
                        _menuItem(
                          context,
                          icon: Icons.help_outline,
                          title: 'Help Center',
                        ),
                        _menuItem(
                          context,
                          icon: Icons.privacy_tip_outlined,
                          title: 'Privacy Policy',
                        ),
                        _menuItem(
                          context,
                          icon: Icons.people_outline,
                          title: 'Invites Friends',
                        ),
                        _menuItem(
                          context,
                          icon: Icons.logout,
                          title: 'Log out',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _menuItem(BuildContext context,
      {required IconData icon, required String title}) {
    return InkWell(
      onTap: () => _onMenuItemPressed(context, title),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.5.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[900]!,
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.grey[400],
              size: 6.w,
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[400],
              size: 4.w,
            ),
          ],
        ),
      ),
    );
  }
}
