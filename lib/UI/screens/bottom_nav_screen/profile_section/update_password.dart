import 'package:find_it/UI/components/custom_container.dart';
import 'package:find_it/UI/components/custom_text_form_field.dart';
import 'package:find_it/core/constants/constant_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> changePassword(BuildContext context) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      final credential = EmailAuthProvider.credential(email: user!.email!, password: oldPasswordController.text.trim());
      await user.reauthenticateWithCredential(credential);
      if(oldPasswordController.text != newPasswordController.text && newPasswordController.text == confirmPasswordController.text){
        await user.updatePassword(newPasswordController.text.trim()).then((value){
          Navigator.pop(context);
        });
        ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Password Updated Successfully')),
               );
      }
    } on FirebaseException catch (e){
      if(e.code == 'invalid-credential'){
        ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Old Password is Incorrect')),
              );
      }else if(e.code == 'too-many-requests') {
        ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Too many requests. Try again later')),
              );
      }
      print(e.code);
    }catch (e){
      ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: $e')),
              );
    }
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ConstantColors.orangeShade,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: CustomTextFormField(controller: oldPasswordController, hintText: 'Enter old password', label: 'old password', decoration: InputDecoration()),
          ),
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: CustomTextFormField(controller: newPasswordController, hintText: 'Enter your new password', label: 'new password', decoration: InputDecoration()),
          ),
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: CustomTextFormField(controller: confirmPasswordController, hintText: 'confirm password', label: 'confirm password', decoration: InputDecoration()),
          ),
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: InkWell(
                onTap: (){
                  changePassword(context);
                },
                child: CustomContainer(text: 'Update Password', height: height * 0.08)),
          )
        ],
      ),
    );
  }
}
