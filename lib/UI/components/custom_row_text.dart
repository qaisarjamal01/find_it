import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomRowText extends StatelessWidget {
  String text;
  String text1;
  CustomRowText({
    required this.text,
    required this.text1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,style: TextStyle(fontSize: 2.h),),
        Text(text1,style: TextStyle(fontSize: 2.h,color: Color(0xffFFA500),fontWeight: FontWeight.bold),),
      ],
    );
  }
}