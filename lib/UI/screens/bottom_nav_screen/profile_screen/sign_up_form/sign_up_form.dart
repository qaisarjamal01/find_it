
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../core/constants/constant_color.dart';
import '../../../../components/custom_container.dart';
import '../../../../components/custom_row_divider.dart';
import '../../../../components/custom_social_container.dart';
import '../../../../components/custom_text_form_field.dart';
import '../../bottom_navigation_bar_screen.dart';
import '../login_form/login_form.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    bool isSelected = true;
    return Scaffold(
      backgroundColor: ConstantColors.orangeShade,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Center(child: Text('Sign Up',style: TextStyle(fontSize: 0.4.dp,fontWeight: FontWeight.bold),)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(
                  hintText: 'Email', label: 'Email', decoration: const InputDecoration(), controller: emailController,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(hintText: 'Contact', label: 'Contact', decoration: const InputDecoration(), controller: contactController,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(hintText: 'Create Password', label: 'Password', decoration: const InputDecoration(), controller: passwordController,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(hintText: 'Confirm Password', label: 'Confirm', decoration: const InputDecoration(), controller: confirmController,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () async {
                try {
                  print(emailController.text);
                  print(passwordController.text);
                 await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim());
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>BottomNavigationBarScreen()));
                }
                    on FirebaseException catch(e){
                  print(e.code);
                    }
                  },
                  child: CustomContainer(text: 'SignUp', height: size*0.08)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Already have an account?',style: TextStyle(fontSize: 0.26.dp),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> LoginForm()));
                      },
                      child: Text('Login',style: TextStyle(fontSize: 0.26.dp,color: Color(0xffFFA500)),)),
                ),
              ],
            ),
            CustomRowDivider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSocialContainer(icon: 'assets/icons/FacebookIcon.png', text: 'SignUp with Facebook', height: size*0.08),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSocialContainer(icon: 'assets/icons/GoogleIcon.png', text: 'SignUp with Google', height: size*0.08)
            )
          ]),
      )
        );
  }
}