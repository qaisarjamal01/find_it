
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/constant_color.dart';
import '../../../components/custom_container.dart';
import '../../../components/custom_profile_list_tile.dart';

import '../../auth/login_form/login_form.dart';
import '../../auth/sign_up_form/sign_up_form.dart';
import 'PrivacyPolicyScreen/privacy_policy_screen.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ConstantColors.orangeShade,
      appBar: AppBar(
        title: Text('Profile',style: TextStyle(color: Color(0xffFFFFFF)),),
        centerTitle: true,
        backgroundColor: Color(0xff003366),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                Container(
                  height: 14.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                      //color: Colors.blue,
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(image: AssetImage('assets/images/profile_pic.jpg'),fit: BoxFit.cover)
                  ),
                ),
                Positioned(
                  bottom: 0.h,
                  right: 0.w,
                  child: Container(
                    height: 4.h,
                    width: 8.w,
                    decoration: BoxDecoration(
                      //color: Colors.blue,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(Icons.camera_alt_outlined,color: Color(0xffFFA500),),
                  ),
                ),
                //CircleAvatar(backgroundImage: AssetImage('assets/images/profile_pic.jpg'),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Qaisar Jamal',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 3.h),),
          ),
          CustomProfileListTile(title: 'Account Details', icon: Icons.settings, onPress: (){}),
          CustomProfileListTile(title: 'Contact Information', icon: Icons.perm_contact_calendar_rounded, onPress: (){}),
          CustomProfileListTile(title: 'Privacy and Policy', icon: Icons.privacy_tip_outlined, onPress: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>PrivacyPolicyScreen()));
          }),
          CustomProfileListTile(title: 'Share', icon: Icons.share, onPress: (){}),
          CustomProfileListTile(title: 'Logout', icon: Icons.logout, onPress: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginForm()));
          }),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> LoginForm()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomContainer(text: 'Logout', height: size*0.08),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUpForm()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Delete Account',style: TextStyle(color: Color(0xffFFA500),fontSize: 3.h),),
            ),
          )
        ],
      ),
    );
  }
}
