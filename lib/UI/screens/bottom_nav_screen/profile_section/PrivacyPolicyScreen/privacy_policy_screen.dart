
import 'package:flutter/material.dart';

import '../../../../../core/constants/constant_color.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ConstantColors.orangeShade,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size*0.02,),
              Text('Privacy Policy',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              Text('Last Updated: [06/09/2024]',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: size*0.04,),
              Text('Welcome to [Your App Name]! Your privacy is important to us. This Privacy Policy outlines how we collect, use, and protect your information when you use our app. By accessing and using our app, you agree to the terms described in this policy.',style: TextStyle(fontSize: 18)),
              Text('1. Information We Collect',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              Text('a.Personal Information:\n   When you register or post an item (lost\n   or found), we may collect personal\n   details such as your name, email\n   address, phone number, and other\n   contact details.'
                  '\nb.Photos and Descriptions:\n   You may upload photos and provide\n   descriptions of lost or found items.\n   These are publicly visible to other users.'
                  '\nc.Location Data:\n   If you choose, you may share your\n   location to help others find or return\n   items. We use your location data only\n   with your permission.'
                  '\nd.Usage Data:\n   We collect data on how you use the app,\n   including your interactions, the features\n   you use, and device information (such\n   as IP address, device ID, and browser\n   type).',style: TextStyle(fontSize: 18)),
              Text('2. How We Use Your Information',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              Text('a.To Provide the Service:\n   Your information helps us connect lost\n   and found items with their rightful\n   owners.\n'
                  'b.Communication:\n   We may use your contact details to\n   notify you of updates or changes, or if\n   someone finds or claims your\n   item.\n'
                  'c.Improvement of Services:\n   We analyze app usage to improve\n   features, fix bugs, and enhance the user\n   experience.\n'
                  'd.Safety & Security:\n   We may use your information to prevent\n   fraud, enforce our policies, and protect\n   our community.',style: TextStyle(fontSize: 18)),
              Text('3. Sharing Your Information',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              Text('    We do not sell or rent your personal\n    information. However, we may share\n    your information:\n'
                  'a.With Other Users: Your name, contact information, and item details will be shared with users who are either looking for or reporting an item.'
                  'Third-Party Services: We may use trusted third-party services (e.g., for analytics or payment processing) that access limited data under strict confidentiality agreements.'
        'Legal Requirements: We may share your information if required by law, to protect our rights, or to prevent illegal activities.',style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
