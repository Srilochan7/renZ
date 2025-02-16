import 'package:culture/ui/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<Map<String, String>> _introData = [
    {
      'image': 'assets/images/intro1.jpeg',
      'title': 'FIND THE BEST\nCOLLECTIONS',
      'subtitle': 'From the latest drops and exclusive releases to\ninsider tips and style advice.',
    },
    {
      'image': 'assets/images/intro2.jpeg',
      'title': 'STAY AHEAD OF\nTHE GAME',
      'subtitle': 'Get early access to premium releases and\nstreetwear updates.',
    },
    {
      'image': 'assets/images/intro3.jpeg',
      'title': 'JOIN THE\nCULTURE',
      'subtitle': 'Connect with fellow streetwear enthusiasts\nand build your style.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_currentPage < _introData.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: _introData.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 4.h),
                            height: 55.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                _introData[index]['image']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            _introData[index]['title']!,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.delaGothicOne(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w200
                        ),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            _introData[index]['subtitle']!,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.zenDots(
                          color: Colors.grey,
                          fontSize: 12.sp,
                        ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _introData.length,
                      (index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 1.w),
                        height: 1.h,
                        width: _currentPage == index ? 8.w : 2.w,
                        decoration: BoxDecoration(
                          color: _currentPage == index 
                              ? Colors.white 
                              : Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
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
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                    },
                    child: Text(
                      'Start Now',
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
        );
      },
    );
  }
}