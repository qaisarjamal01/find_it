import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomContainer extends StatelessWidget {
  String text;
  double height;
  //double size;
  CustomContainer({
    required this.text,
    required this.height,
    super.key,
    //required this.size,
  });

  // final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Color(0xff003366),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: Text(text,style: TextStyle(color: Color(0xffFFFFFF),fontSize: 3.h),)),
    );
  }
}