import 'package:find_it/core/constants/constant_color.dart';
import 'package:flutter/material.dart';

class ContactInformation extends StatefulWidget {
  String? userContact;
  String? userEmail;
   ContactInformation({required this.userContact,required this.userEmail,super.key});

  @override
  State<ContactInformation> createState() => _ContactInformationState();
}

class _ContactInformationState extends State<ContactInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.orangeShade,
      appBar: AppBar(
        title: Text('Contact Information',style: TextStyle(color: ConstantColors.textColor),),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('userContact:\n${widget.userContact ?? 'N/A'}',style: TextStyle(fontSize: 20,color: ConstantColors.textColor),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('userEmail:\n${widget.userEmail ?? 'N/A'}',style: TextStyle(fontSize: 20,color: ConstantColors.textColor)),
              ),
            ],
          ),
        ),
      )
    );
  }
}
