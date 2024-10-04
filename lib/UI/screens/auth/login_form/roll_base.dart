import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_it/UI/screens/auth/login_form/login_form.dart';
import 'package:find_it/UI/screens/auth/sign_up_form/sign_up_form.dart';
import 'package:find_it/UI/screens/bottom_nav_screen/bottom_navigation_bar_screen.dart';
import 'package:find_it/UI/screens/bottom_nav_screen/dashboard_screen/categories/MobilesCategory/mobile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCheck  {
  void checkUserRoleAndNavigate(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

      String role = userDoc.get('userRole');

      if (role == 'admin') {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MobileScreen()));
      }
      else if (role == 'user'){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomNavigationBarScreen()));
      }
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginForm()));
    }
  }

  void checkUserRole(BuildContext context)async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? role = sp.getString('role');

    if (role == 'admin') {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MobileScreen()));
    }
    else if (role == 'user'){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomNavigationBarScreen()));
    }
  }


  void signInUser(BuildContext context){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpForm()));
   }
}