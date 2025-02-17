import 'package:culture/ui/Screens/cart.dart';
import 'package:culture/ui/Screens/home.dart';
import 'package:culture/ui/Screens/profile.dart';
import 'package:culture/ui/Screens/shop.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Home(),
    Shop(),
    Cart(),
    Profile(),
  ];

  void _onItemTapped(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: IndexedStack(
            index: _selectedIndex,
            children: _screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            selectedItemColor: Colors.white,
            unselectedItemColor: const Color.fromARGB(255, 118, 118, 118),
            currentIndex: _selectedIndex, 
            onTap: _onItemTapped, 
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Shop'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        );
      },
    );
  }
}
