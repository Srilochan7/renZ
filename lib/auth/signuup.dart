import 'dart:convert';
import 'package:culture/Screens/home.dart';
import 'package:culture/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController pass = TextEditingController();
    TextEditingController name = TextEditingController();
    bool _isloading = false;
    final _formKey = GlobalKey<FormState>();

  Future<Map<String ,dynamic>> logins(String email,String password,String username)async{
      final url = Uri.parse('http://10.0.2.2:3000/registration');
      final response = await http.post(url,
      headers: {
        'Content-type':'application/json',
      },
      body: jsonEncode({
        'email':email,
        'password':password,
        'username':username
      }),
      );

      if(response.statusCode==200){
        print("status code is good");
        print(response.body);
        return jsonDecode(response.body);

        
      }
      else {
        print("${response.statusCode}");
        print("${response.body}");
    throw Exception('Failed to login');
  }
  }


Future<void> handleLogin()async{
  if(_formKey.currentState?.validate() ?? false){
  setState(() {
    _isloading = true;
  });

  try{
    final response = await logins(email.text, pass.text, name.text);
    if(response.isNotEmpty){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed else')));
    }
  }catch(error){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login fuked ${error}')));
  }finally{
    setState(() {
      _isloading = false;
    });
  }}else{
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please correct the errors in the form')),
      );
  }
}

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 249, 249),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children:<Widget>[
              const SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("SignUp",style: GoogleFonts.poppins(fontSize: 40,fontWeight: FontWeight.bold,),),
                )
              ),
              const SizedBox(height: 20,),
          
              SizedBox(
                width: 350,
                height: 75,
                child: TextFormField(
                  enabled: true,    
                  
                  controller: email,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    hintText: "Enter Email",
                    hintStyle: TextStyle(color:Color.fromARGB(255, 155, 155, 155)),
                    labelStyle: TextStyle(color: Color.fromARGB(255, 155, 155, 155)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 5,color: Color.fromARGB(255, 255, 255, 255),),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
          width: 5,
          color: Color.fromARGB(255, 255, 255, 255),
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          
                    
                  ),
                  validator: (value){
                    if(value ==null || value.isEmpty){
                      return "Please enter an email";
                    }
                    else if(!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)){
                      return "Please enter a valid email";
                    }
                    else{
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                
                width: 350,
                height: 75,
                child: TextFormField(
                  enabled: true,    
                  controller: pass,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    hintText: "Enter Password",
                    hintStyle: TextStyle(color:Color.fromARGB(255, 155, 155, 155)),
                    labelStyle: TextStyle(color: Color.fromARGB(255, 155, 155, 155)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 5,color: Color.fromARGB(255, 255, 255, 255),),
                    ),
                    enabledBorder: OutlineInputBorder(
                    
                      borderSide: BorderSide(
          
          width: 5,
          color: Color.fromARGB(255, 255, 255, 255),
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
                    
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Please enter a name";
                    }
                  },
                ),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: 350,
                height: 75,
                child: TextFormField(
                  enabled: true,    
                  controller: name,
                  decoration: const InputDecoration(
                    labelText: "Name",
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    hintText: "Enter Name",
                    hintStyle: TextStyle(color:Color.fromARGB(255, 155, 155, 155)),
                    labelStyle: TextStyle(color: Color.fromARGB(255, 155, 155, 155)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 5,color: Color.fromARGB(255, 255, 255, 255),),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
          width: 5,
          color: Color.fromARGB(255, 255, 255, 255),
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
                    
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Please enter a name";
                    }
                  },
                ),
              ),
        
              
        
              const SizedBox(height: 20,),
              _isloading
              ? CircularProgressIndicator():
              SizedBox(
                width: 350,
                height: 60,
                child: ElevatedButton(
                  
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 96, 85, 216)),
                    elevation: WidgetStatePropertyAll(30)
                  ),
                  onPressed: (){
                    handleLogin();
                    
                  }, child: 
                 
                  Text("SignIn",style: GoogleFonts.poppins(color: Colors.white,fontSize: 30),))
                ),
                SizedBox(height: 20),
        
              Row(
                children: [
                  SizedBox(width: 90,),
                  Text("Already have an account?",
                  style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600)
                  ),
                  SizedBox(width: 5,),
                  InkWell(
                    child: Text("Login",
                    style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 96, 85, 216))
                    ,
                    ),
                    onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                    },),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
