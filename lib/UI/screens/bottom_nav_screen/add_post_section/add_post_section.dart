import'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/constants/constant_color.dart';
import 'FoundPostCategory/found_post_details_screen.dart';
import 'LostPostCategory/lost_post_details_screen.dart';

class AddPostSection extends StatefulWidget {
  const AddPostSection({super.key});

  @override
  State<AddPostSection> createState() => _AddPostSectionState();
}

class _AddPostSectionState extends State<AddPostSection> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: ConstantColors.orangeShade,
      appBar: AppBar(
        title: Text('Add Post',style: TextStyle(color: Color(0xffFFFFFF)),),
        centerTitle: true,
        backgroundColor: Color(0xff003366),
      ),
      body: Center(
        child: Container(
          height: height*0.4,
          //width: width*0.8,
          color: ConstantColors.primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Text('What kind of Post you want to add?',style: TextStyle(color: ConstantColors.textColor,fontWeight: FontWeight.normal,fontSize: 2.7.h),),
              ),
              Padding(padding: EdgeInsets.only(top: 4.h)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>LostPostDetailsScreen()));
                  }, child: Text('Lost',style: TextStyle(color: Color(0xffFFA500),fontWeight:FontWeight.bold,fontSize: 3.h),)),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>FoundPostDetailsScreen()));
                  }, child: Text('Found',style: TextStyle(color: Color(0xffFFA500),fontSize: 3.h,fontWeight: FontWeight.bold),))
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}