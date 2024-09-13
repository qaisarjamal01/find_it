import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextFormField extends StatelessWidget {
  String hintText;
  String label;

  TextEditingController controller;
  CustomTextFormField({
    required this.controller,
    required this.hintText,
    required this.label,
    super.key, required InputDecoration decoration,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          label: Text(label,style: TextStyle(color: Color(0xff000000),fontSize: 2.h),),
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xffFFA500),width: 0.3.w,style: BorderStyle.solid)
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 0.3.w,color: Color(0xffFFA500))
          )
      ),
    );
  }
}
