import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier{
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  void textControllers(){
    notifyListeners();
  }
}