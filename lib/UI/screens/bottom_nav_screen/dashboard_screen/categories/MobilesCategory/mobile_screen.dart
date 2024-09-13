import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../core/constants/constant_color.dart';
import '../../../../../components/custom_items.dart';
import '../Item details/item_details.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  List<CustomItem> items = [
    CustomItem('infinix','lahore','25 August 2024','assets/images/infinix.jpeg'),
    CustomItem('infinix','peshawar','16 August 2024','assets/images/infinix1.jpeg'),
    CustomItem('iphone','faisalabad','19 August 2024','assets/images/iphone.jpeg'),
    CustomItem('oppo','lahore','1 August 2024','assets/images/oppo1.jpeg'),
    CustomItem('samsung','peshawar','6 August 2024','assets/images/samsung.jpeg'),
    CustomItem('samsung','karachi','13 August 2024','assets/images/samsung1.jpeg'),
    CustomItem('vivo','quetta','11 August 2024','assets/images/vivo.jpeg'),
    CustomItem('vivo','peshawar','10 August 2024','assets/images/vivo Y56.jpeg'),
    CustomItem('vivo','khyber','19 August 2024','assets/images/vivo1.jpeg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.orangeShade,
      appBar: AppBar(
        title: Text('All Mobiles',style: TextStyle(color: Color(0xffFFFFFF)),),
        centerTitle: true,
        backgroundColor: Color(0xff003366),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context,index){
            final item = items[index];
            return ListTile(
              leading: Image.asset(item.image,height: 30.h,width: 18.w,),
              title: Text(item.title),
              subtitle: Text(item.location),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(item.date),
                  SizedBox(height: 1.h,),
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>ItemDetails(
                          image: item.image,
                          title: item.title,
                          location: item.location,
                          date: item.date,
                        )));
                      },
                      child: Text('view details',style: TextStyle(color: Color(0xffFFA500),fontSize: 0.2.dp),))
                ],
              ),
            );
          }),
    );
  }
}

