import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/constant_color.dart';
import '../../../components/custom_text_form_field.dart';

class AdminSection extends StatefulWidget {
  const AdminSection({super.key});

  @override
  State<AdminSection> createState() => _AdminSection();
}

class _AdminSection extends State<AdminSection> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ConstantColors.orangeShade,
      appBar: AppBar(
        title: Text(
          'Admin Section',
          style: TextStyle(color: Color(0xffFFFFFF)),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff003366),
      ),
      body: content(),
    );
  }

  Widget content() {
    final Uri whatsApp = Uri.parse('https://wa.me/+923028076931');
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.orange.shade100),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
                  maxRadius: 100,
                  minRadius: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Qaisar Jamal (Admin)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'If you want the confirmation of product you go directly to admin whatsApp through the whatsApp icon.Further procedure will be performed in the whatsApp.',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    'WhatsApp',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  trailing: Container(
                    width: 50,
                    height: 50,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                        onTap: () async {
                          launchUrl(whatsApp);
                        },
                        child: Image.asset('assets/icons/whatsapp.png')),
                  ),
                ),
              )
              //Icon(Icons.email)
            ],
          ),
        ),
      ),
    );
  }
}
