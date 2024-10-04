import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../core/constants/constant_color.dart';

class ItemDetails extends StatefulWidget {
  String image;
  String title;
  String location;
  String date;
  ItemDetails({required this.image,required this.date,required this.location,required this.title,super.key});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ConstantColors.orangeShade,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(widget.image,height: 30.h,width: double.infinity,fit: BoxFit.cover,),
          Text(widget.title,style: TextStyle(fontSize: 4.h),),
          Text(widget.location,style: TextStyle(fontSize: 4.h),),
          Text(widget.date,style: TextStyle(fontSize: 4.h),),
        ],
      )
    );
  }
}
