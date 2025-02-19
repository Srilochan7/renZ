import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';


class AuthService {
  Future<bool> userSignUp({
    required String email, 
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email,password: password);

      Fluttertoast.showToast(
        msg : "Sign Up sucessfull",
        toastLength : Toast.LENGTH_SHORT,
        gravity : ToastGravity.BOTTOM,
        backgroundColor : Colors.white,
        textColor: Colors.black,
        fontSize : 14.sp,
      );
      return true;
    } on FirebaseAuthException catch(e){
      String message = '';
      if(e.code == 'weak-password'){
        message = "Your password is too weak. Try another";
      }
      else if(e.code == 'email-already-in-use'){
        message = 'This email is already in use';
      }
      else{
        message = "An error occured ${e.message}";
      }
      Fluttertoast.showToast(
        msg : message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.white70,
        textColor: Colors.black,
        fontSize: 14.sp,
      );
      return false;

    }
    catch(e){
      Fluttertoast.showToast(
        msg : "An unexpected error occured",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.white70,
        textColor: Colors.black45,
        fontSize: 14.sp,
      );
      return false;
    }
}

  Future<bool> userLogin({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      Fluttertoast.showToast(
        msg: "Login Sucessful",
        toastLength: Toast.LENGTH_SHORT,
        textColor: Colors.black,
        backgroundColor: Colors.white,
        gravity: ToastGravity.SNACKBAR,
        fontSize: 14.sp,  
      );
      return true;
    }
    on FirebaseAuthException catch (e) {
      String message = '';
      if(e.code == 'wrong-password'){
        message = 'Your password is wrong';
      }
      else if(e.code == 'user-not-found'){
        message = "No user found with this email";
      }
      else{
        message = "Unexpected error ${e.message}";
      }

      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        textColor: Colors.black,
        backgroundColor: Colors.white,
        gravity: ToastGravity.SNACKBAR,
        fontSize: 14.sp,  
      );
      return false;
    }
    catch (e){
      Fluttertoast.showToast(
        msg: "An unexpected error occured : $e",
        toastLength: Toast.LENGTH_SHORT,
        textColor: Colors.black,
        backgroundColor: Colors.white,
        gravity: ToastGravity.SNACKBAR,
        fontSize: 14.sp,  
      );
      return true;
    }
  }
}
