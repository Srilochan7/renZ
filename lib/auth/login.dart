import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:culture/Screens/home.dart';
import 'package:culture/auth/signuup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

 Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('http://10.0.2.2:3000/login');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      final responseBody = jsonDecode(response.body);
      if (response.statusCode == 200 && responseBody['status'] == true) {
        return responseBody;
      } else {
        throw Exception(responseBody['error'] ?? 'Failed to login');
      }
    } catch (e) {
      print('Login error: $e');
      rethrow;
    }
  }

  Future<void> handleLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      try {
        final response = await login(_emailController.text, _passwordController.text);
        if (response.containsKey('token')) {
          // Save the JWT token
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('jwt_token', response['token']);

          print('Login successful. Token: ${response['token']}');

          // Navigate to Home page
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
        } else {
          print('Login response does not contain token: $response');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login successful, but no token received')));
        }
      } catch (error) {
        print('Login failed: $error');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed: ${error.toString()}')));
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 249, 249),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Login",
                    style: GoogleFonts.poppins(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 350,
                height: 75,
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    hintText: "Enter Email",
                    hintStyle: TextStyle(color: Color.fromARGB(255, 155, 155, 155)),
                    labelStyle: TextStyle(color: Color.fromARGB(255, 155, 155, 155)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 5, color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 5,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter an email";
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 350,
                height: 75,
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    hintText: "Enter Password",
                    hintStyle: TextStyle(color: Color.fromARGB(255, 155, 155, 155)),
                    labelStyle: TextStyle(color: Color.fromARGB(255, 155, 155, 155)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 5, color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 5,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a password";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              _isLoading
                  ? CircularProgressIndicator()
                  : SizedBox(
                      width: 350,
                      height: 60,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 96, 85, 216)),
                          elevation: MaterialStatePropertyAll(30),
                        ),
                        onPressed: handleLogin,
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 5),
                  InkWell(
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 96, 85, 216),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
