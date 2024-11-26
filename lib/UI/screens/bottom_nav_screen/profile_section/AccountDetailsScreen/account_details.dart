import 'package:find_it/core/constants/constant_color.dart';
import 'package:flutter/material.dart';

class AccountDetailsScreen extends StatefulWidget {
  final String? userName;
  final String? userRole;
  final String? userEmail;
  AccountDetailsScreen({required this.userRole,required this.userEmail,required this.userName,super.key});

  @override
  State<AccountDetailsScreen> createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.orangeShade,
      appBar: AppBar(
        title: Text('Account Details',style: TextStyle(color: ConstantColors.textColor),),
        centerTitle: true,
        backgroundColor: ConstantColors.primaryColor,
      ),
      body: Center(
      child: Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
          color: ConstantColors.primaryColor,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('userName: ${widget.userName ?? 'N/A'}',style: TextStyle(color: ConstantColors.textColor,fontSize: 20,fontWeight: FontWeight.bold),),
          Text('userEmail: ${widget.userEmail ?? 'N/A'}',style: TextStyle(color: ConstantColors.textColor,fontSize: 20,fontWeight: FontWeight.bold)),
          Text('userRole: ${widget.userRole ?? 'N/A'}',style: TextStyle(color: ConstantColors.textColor,fontSize: 20,fontWeight: FontWeight.bold))
        ],
      ),
    )) );
  }
}
