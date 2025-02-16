import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
    int _selectedIndex = 0;

    void _onItemTapped(int i){
        setState((){
          _selectedIndex = i;
        });
    }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return 
BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 118, 118, 118),
        currentIndex: _selectedIndex, // Track the selected index
        onTap: _onItemTapped, // Handle the navigation logic
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home', // No label for this item
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Shop', // No label for this item
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Cart', // Label for the cart item
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile', // No label for this item
          ),
        ],
      );
      },
    );
  }
}

