import 'dart:core';
import 'dart:ui';
import 'package:flutter/material.dart';

class CustomSocialContainer extends StatelessWidget {
  //double size;
  final String text;
  final String icon;
  final double height;
  CustomSocialContainer({
    required this.icon,
    required this.text,
    required this.height,
    super.key,
    //required this.size,
  });

  //final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        decoration: BoxDecoration(
          color: Color(0xff003366),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(icon, height: 50,width: 50,), ),
            Expanded(child: Center(child: Text(text,style: TextStyle(color: Colors.white,fontSize: 20),))),
          ],
        )
    );
  }
}