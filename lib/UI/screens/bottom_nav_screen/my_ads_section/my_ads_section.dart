
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/constant_color.dart';

class MyAdsSection extends StatefulWidget {
  const MyAdsSection({super.key});

  @override
  State<MyAdsSection> createState() => _MyAdsSectionState();
}

class _MyAdsSectionState extends State<MyAdsSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.orangeShade,
      appBar: AppBar(
        title: Text('My Ads',style: TextStyle(color: Color(0xffFFFFFF)),),
        centerTitle: true,
        backgroundColor: Color(0xff003366),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
            onPressed: (){

            },
            child: Text('Lost',style: TextStyle(color: Color(0xffFFA500),fontSize: 3.h),)),
        TextButton(
            onPressed: (){

            },
            child: Text('Found',style: TextStyle(color: Color(0xffFFA500),fontSize: 3.h),))
      ],
    ),
    );
  }
}
