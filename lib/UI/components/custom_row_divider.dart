import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomRowDivider extends StatelessWidget {
  const CustomRowDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 1,
              endIndent: 10,
            ),
          ),
          Text('Or',style: TextStyle(fontSize: 3.h),),
          Expanded(
            child: Divider(
              thickness: 1,
              endIndent: 10,
            ),
          )
        ],
      ),
    );
  }
}