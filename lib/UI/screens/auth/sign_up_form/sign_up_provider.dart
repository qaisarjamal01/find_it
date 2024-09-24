import 'package:flutter/material.dart';

class SignUpProvider with ChangeNotifier{
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _userPasswordController = TextEditingController();
  TextEditingController _userConfirmPasswordController = TextEditingController();
  TextEditingController _userContactController = TextEditingController();

  TextEditingController get userNameController => _userNameController;
  TextEditingController get userEmailController => _userEmailController;
  TextEditingController get userPasswordController => _userPasswordController;
  TextEditingController get userConfirmPasswordController => _userConfirmPasswordController;
  TextEditingController get userContactController => _userContactController;

  void textControllers(){
    notifyListeners();
  }
}