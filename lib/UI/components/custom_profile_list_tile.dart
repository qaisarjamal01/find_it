import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomProfileListTile extends StatelessWidget {
  String title;
  IconData icon;
  bool endIcon;
  VoidCallback onPress;
  CustomProfileListTile({
    required this.title,
    required this.icon,
    required this.onPress,
    super.key,
    this.endIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
          height: 2.h,
          width: 2.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(icon)
      ),
      title: Text(title),
      trailing: endIcon? Container(
        height: 2.h,
        width: 2.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(Icons.arrow_forward_ios_rounded),
      ):null,
    );
  }
}