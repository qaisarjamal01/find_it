import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../core/constants/constant_color.dart';
import '../../../components/custom_container.dart';
import '../../../components/custom_row_divider.dart';
import '../../../components/custom_social_container.dart';
import '../../../components/custom_text_form_field.dart';
import '../../bottom_nav_screen/bottom_navigation_bar_screen.dart';
import '../sign_up_form/sign_up_form.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ConstantColors.orangeShade,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Center(child: Text('Login',style: TextStyle(fontSize: 0.4.dp,fontWeight: FontWeight.bold),)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(hintText: 'Email', label: 'Email', decoration: InputDecoration(), controller: emailController,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(hintText: 'Password', label: 'Password', decoration: InputDecoration(), controller: passwordController,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Forgot Password?',style: TextStyle(color: Color(0xffFFA500),fontSize: 0.29.dp),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () async {
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();

                    if (email.isEmpty || password.isEmpty) {
                      // Show an alert dialog if fields are empty
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text('Error'),
                          content: const Text('Please enter both email and password.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: const Text('Okay'),
                            ),
                          ],
                        ),
                      );
                      return;
                    }
                    try {
                      // Attempt to sign in with Firebase
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );

                      // If successful, navigate to BottomNavigationBarScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BottomNavigationBarScreen(),
                        ),
                      );
                    } catch (e) {
                      // Show error message if login fails
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text('Login Failed'),
                          content: Text(e.toString()),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: const Text('Okay'),
                            ),
                          ],
                        ),
                      );
                    }
                  },

                  child: CustomContainer(text: 'Login', height: size*0.08)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Don\'t have an account?',style: TextStyle(fontSize: 0.26.dp),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> SignUpForm()));
                      },
                      child: Text('SignUp',style: TextStyle(fontSize: 0.26.dp,color: Color(0xffFFA500)),)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomRowDivider(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSocialContainer(icon: 'assets/icons/FacebookIcon.png', text: 'Login with Facebook', height: size*0.08),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSocialContainer(icon: 'assets/icons/GoogleIcon.png', text: 'Login with Google', height: size*0.08),
            ),
          ],
        ),
      ),
    );
  }
}