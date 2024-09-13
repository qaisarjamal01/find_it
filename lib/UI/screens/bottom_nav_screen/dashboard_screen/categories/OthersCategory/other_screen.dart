import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../core/constants/constant_color.dart';
import '../../../../../components/custom_items.dart';
import '../Item details/item_details.dart';

class OtherScreen extends StatefulWidget {
  const OtherScreen({super.key});

  @override
  State<OtherScreen> createState() => _OtherScreenState();
}

class _OtherScreenState extends State<OtherScreen> {
  List<CustomItem> items = [
    CustomItem('cash', 'peshawar', '12 August 2024', 'assets/images/cash.jpg'),
    CustomItem('debitCard', 'quetta', '1 June 2024', 'assets/images/debitCart.jpg'),
    CustomItem('dell Laptop', 'lahore', '23 May 2024', 'assets/images/dellLaptop.jpg'),
    CustomItem('hp Laptop', 'Islamabad', '2 March 2024', 'assets/images/hpLaptop.jpg'),
    CustomItem('car', 'karachi', '25 April 2024', 'assets/images/car.jpg'),
    CustomItem('wallet', 'faisalabad', '24 May 2024', 'assets/images/wallet.jpg'),
    CustomItem('wallet2', 'lahore', '23 January 2024', 'assets/images/wallet2.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.orangeShade,
      appBar: AppBar(
        title: Text('Others',style: TextStyle(color: Color(0xffFFFFFF)),),
        centerTitle: true,
        backgroundColor: Color(0xff003366),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (_,index){
        final item = items[index];
        return ListTile(
          leading: Image.asset(item.image,height: 30.h,width: 18.w,),
          title: Text(item.title),
          subtitle: Text(item.location),
          trailing: Column(
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