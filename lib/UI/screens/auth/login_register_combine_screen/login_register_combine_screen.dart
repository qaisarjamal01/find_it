import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../core/constants/constant_color.dart';
import '../../auth/login_form/login_form.dart';
import '../../auth/sign_up_form/sign_up_form.dart';

class LoginRegisterCombineScreen extends StatefulWidget {
  const LoginRegisterCombineScreen({super.key});

  @override
  State<LoginRegisterCombineScreen> createState() => _LoginRegisterCombineScreenState();
}

class _LoginRegisterCombineScreenState extends State<LoginRegisterCombineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.orangeShade,
      body: Center(
        child: Container(
          height: 50.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color(0xffFFF3E0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Text('If you have an account then go to login! \n If not then register yourself',style: TextStyle(fontSize: 0.24.dp),)),
              SizedBox(height: 2.h,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginForm()));
                },
                child: Container(
                  height: 10.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      color: Color(0xff003366),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Center(child: Text('Login',style: TextStyle(fontSize: 3.h,fontWeight: FontWeight.bold,color: Color(0xffFFFFFF)),)),
                ),
              ),
              SizedBox(height: 2.h,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUpForm()));
                },
                child: Container(
                  height: 10.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      color: Color(0xff003366),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Center(child: Text('Register',style: TextStyle(fontSize: 3.h,fontWeight: FontWeight.bold,color: Color(0xffFFFFFF)),)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}