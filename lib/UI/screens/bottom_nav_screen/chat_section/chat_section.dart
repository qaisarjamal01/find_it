
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/constant_color.dart';
import '../../../components/custom_text_form_field.dart';

class ChatSection extends StatefulWidget {
  const ChatSection({super.key});

  @override
  State<ChatSection> createState() => _ChatSectionState();
}

class _ChatSectionState extends State<ChatSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.orangeShade,
      appBar: AppBar(
        title: Text('Messages',style: TextStyle(color: Color(0xffFFFFFF)),),
        centerTitle: true,
        backgroundColor: Color(0xff003366),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 7.h,left: 2.w,right: 2.w),
        child: CustomTextFormField(
            hintText: 'search something', label: 'Searching', decoration: InputDecoration(), controller: TextEditingController(),),
      ),
    );
  }
}
