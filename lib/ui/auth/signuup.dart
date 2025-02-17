import 'dart:convert';
import 'package:culture/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:culture/ui/Screens/home.dart';
import 'package:culture/ui/auth/login.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  Future<Map<String, dynamic>> register(String email, String password) async {
    final url = Uri.parse('http://10.0.2.2:3000/registration');
    final response = await http.post(
      url,
      headers: {'Content-type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      print("Registration successful");
      return jsonDecode(response.body);
    } else {
      print("Registration failed: ${response.statusCode}");
      print("Response body: ${response.body}");
      throw Exception('Failed to register');
    }
  }

  Future<void> handleRegister() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      try {
        final response = await register(email.text, password.text);
        if (response.isNotEmpty) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration failed')));
        }
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration error: $error')));
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(5.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Container(
                        height: 20.h,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
                          child: Image.asset(
                            'assets/images/image_auth.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      SizedBox(height: 4.h),
                      Text(
                        "REGISTER",
                        style: GoogleFonts.delaGothicOne(
                          color: const Color.fromARGB(255, 199, 199, 199),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w200
                        ),
                      ),
                      // SizedBox(height: 1.h,),
                      Text(
                        "START THE JOURNEY NOW",
                        style: GoogleFonts.delaGothicOne(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w200
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        "Join the streetwear community today and be a part of the latest fashion trends.",
                        style: GoogleFonts.zenDots(
                          color: Colors.grey,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      _buildTextField(email, "Email", false),
                      SizedBox(height: 2.h),
                      _buildTextField(password, "Password", true),
                      SizedBox(height: 2.h),
                      _buildTextField(confirmPassword, "Confirm password", true),
                      SizedBox(height: 4.h),
                      _isLoading
                          ? Center(child: CircularProgressIndicator(color: Colors.white))
                          : SizedBox(
                              width: 100.w,
                              height: 6.h,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF3D3D3B),
                                ),
                                onPressed: handleRegister,
                                child: Text(
                                  "Register",
                                  style: GoogleFonts.delaGothicOne(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w200
                        ),
                                ),
                              ),
                            ),
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style : GoogleFonts.poppins(
                                    color: const Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 15.sp,
                                    
                                  ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: LoginPage()));
                            },
                            child: Text(
                              "Login",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(onPressed: (){
                        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Mainscreen()));
                      }, child: Text("Direct"))
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, bool isPassword) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      style: TextStyle(color: Colors.white, fontSize: 15.sp),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white70, fontSize: 12.sp),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color.fromARGB(77, 172, 172, 172)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter $label";
        }
        if (label == "Email" && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return "Please enter a valid email";
        }
        if (label == "Confirm password" && value != password.text) {
          return "Passwords do not match";
        }
        return null;
      },
    );
  }
}