import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_it/UI/screens/auth/sign_up_form/sign_up_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/constants/constant_color.dart';
import '../../../components/custom_container.dart';
import '../../../components/custom_row_divider.dart';
import '../../../components/custom_social_container.dart';
import '../../../components/custom_text_form_field.dart';
import '../../bottom_nav_screen/bottom_navigation_bar_screen.dart';
import '../login_form/login_form.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  SignUpUser(String userName,String userEmail,String userContact,String userRole, String userPassword,String userConfirmPassword)async{
    User? currentUser = FirebaseAuth.instance.currentUser;
    try {
      await FirebaseFirestore.instance.collection('users').doc(currentUser!.uid).set({
        'userName': userName,
        'userEmail':userEmail,
        'userContact':userContact,
        'userRole': userRole,
        'userPassword':userPassword,
        'userConfirmPassword':userConfirmPassword,
        'image_url' : '',
          }).then((value)=>{
      });
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString('userName', userName);
      print(sp.getString('userName'));
    }
    on FirebaseAuthException catch(e) {
      print('error $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final signUpProvider = Provider.of<SignUpProvider>(context);
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
              child: CustomTextFormField(controller: signUpProvider.userNameController, hintText: 'Name', label: 'Name', decoration: const InputDecoration()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(
                  hintText: 'Email', label: 'Email', decoration: const InputDecoration(), controller: signUpProvider.userEmailController,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(hintText: 'Contact', label: 'Contact', decoration: const InputDecoration(), controller: signUpProvider.userContactController,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(hintText: 'Create Password', label: 'Password', decoration: const InputDecoration(), controller: signUpProvider.userPasswordController,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(hintText: 'Confirm Password', label: 'Confirm', decoration: const InputDecoration(), controller: signUpProvider.userConfirmPasswordController,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () async {
                try {
                  print(signUpProvider.userEmailController.text);
                  print(signUpProvider.userPasswordController.text);
                 await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: signUpProvider.userEmailController.text.trim(),
                      password: signUpProvider.userPasswordController.text.trim())
                  .then((value)=> {
                    SignUpUser(
                      signUpProvider.userNameController.text.trim(),
                      signUpProvider.userEmailController.text.trim(),
                      signUpProvider.userContactController.text.trim(),
                      'user',
                      signUpProvider.userPasswordController.text.trim(),
                      signUpProvider.userConfirmPasswordController.text.trim(),

                    )
                 });
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