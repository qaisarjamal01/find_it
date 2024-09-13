import 'dart:async';
import 'package:flutter/material.dart';

import '../bottom_nav_screen/profile_screen/login_register_combine_screen/login_register_combine_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (_)=> LoginRegisterCombineScreen()));
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/splash_screen.jpg'),fit: BoxFit.cover)
        ),
      )
    );
  }
}
