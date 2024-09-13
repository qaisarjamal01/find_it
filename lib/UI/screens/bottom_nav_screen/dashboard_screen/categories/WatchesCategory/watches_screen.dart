
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../core/constants/constant_color.dart';
import '../../../../../components/custom_items.dart';
import '../Item details/item_details.dart';

class WatchesScreen extends StatefulWidget {
  const WatchesScreen({super.key});

  @override
  State<WatchesScreen> createState() => _WatchesScreenState();
}

class _WatchesScreenState extends State<WatchesScreen> {
  List<CustomItem> items = [
    CustomItem('watch', 'peshawar', '12 August 2024', 'assets/images/watch.jpg'),
    CustomItem('watch2', 'lahore', '28 August 2024', 'assets/images/watch2.jpg'),
    CustomItem('watch3', 'khyber', '26 August 2024', 'assets/images/watch3.jpg'),
    CustomItem('watch4', 'peshawar', '11 August 2024', 'assets/images/watch4.jpg'),
    CustomItem('watch5', 'multan', '19 August 2024', 'assets/images/watch5.jpg'),
    CustomItem('watch6', 'Gujranwala', '14 August 2024', 'assets/images/watch6.jpg'),
    CustomItem('watch7', 'karachi', '22 August 2024', 'assets/images/watch7.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.orangeShade,
      appBar: AppBar(
        title: Text('All Watches',style: TextStyle(color: Color(0xffFFFFFF)),),
        centerTitle: true,
        backgroundColor: Color(0xff003366),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context,index){
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
          )
        ],
      ),
    );
  }
}

