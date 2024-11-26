import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../core/constants/constant_color.dart';
import '../../../../../components/custom_items.dart';
import '../../../profile_section/UpdateProductsScreen/update_products.dart';
import '../Item details/item_details.dart';

class LostItems extends StatefulWidget {
  const LostItems({super.key});

  @override
  State<LostItems> createState() => _LostItemsState();
}

class _LostItemsState extends State<LostItems> {
  List<CustomItem> items = [
    CustomItem('cash', 'peshawar', '12 August 2024', 'assets/images/cash.jpg'),
    CustomItem('debitCard', 'quetta', '1 June 2024', 'assets/images/debitCart.jpg'),
    CustomItem('dell Laptop', 'lahore', '23 May 2024', 'assets/images/dellLaptop.jpg'),
    CustomItem('hp Laptop', 'Islamabad', '2 March 2024', 'assets/images/hpLaptop.jpg'),
    CustomItem('car', 'karachi', '25 April 2024', 'assets/images/car.jpg'),
    CustomItem('wallet', 'faisalabad', '24 May 2024', 'assets/images/wallet.jpg'),
    CustomItem('wallet2', 'lahore', '23 January 2024', 'assets/images/wallet2.jpg'),
    CustomItem('infinix','lahore','25 August 2024','assets/images/infinix.jpeg'),
    CustomItem('infinix','peshawar','16 August 2024','assets/images/infinix1.jpeg'),
    CustomItem('iphone','faisalabad','19 August 2024','assets/images/iphone.jpeg'),
    CustomItem('oppo','lahore','1 August 2024','assets/images/oppo1.jpeg'),
    CustomItem('samsung','peshawar','6 August 2024','assets/images/samsung.jpeg'),
    CustomItem('samsung','karachi','13 August 2024','assets/images/samsung1.jpeg'),
    CustomItem('vivo','quetta','11 August 2024','assets/images/vivo.jpeg'),
    CustomItem('vivo','peshawar','10 August 2024','assets/images/vivo Y56.jpeg'),
    CustomItem('vivo','khyber','19 August 2024','assets/images/vivo1.jpeg'),
    CustomItem('bag', 'peshawar', '12 August 2024', 'assets/images/bag.jpeg'),
    CustomItem('bag2', 'lahore', '11 April 2024', 'assets/images/bag2.jpeg'),
    CustomItem('bag3', 'peshawar', '14 August 2024', 'assets/images/bag3.jpeg'),
    CustomItem('bag4', 'peshawar', '12 April 2024', 'assets/images/bag4.jpeg'),
    CustomItem('bag5', 'multan', '12 August 2024', 'assets/images/bag5.jpeg'),
    CustomItem('bag6', 'quetta', '1 may 2024', 'assets/images/bag6.jpeg'),
    CustomItem('bag7', 'peshawar', '30 August 2024', 'assets/images/bag7.jpeg'),
    CustomItem('bag8', 'khyber', '25 August 2024', 'assets/images/bag8.jpeg'),
    CustomItem('bag9', 'peshawar', '12 August 2024', 'assets/images/bag9.jpeg'),
    CustomItem('bag10', 'peshawar', '12 August 2024', 'assets/images/bag10.jpeg'),
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
    String? docId;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: ConstantColors.orangeShade,
      appBar: AppBar(
        title: Text('Lost Items',style: TextStyle(color: Color(0xffFFFFFF)),),
        centerTitle: true,
        backgroundColor: Color(0xff003366),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.h,left: 3.w),
            child: Text('All Items',style: TextStyle(fontSize: 3.h),),
          ),
          Expanded(
            child: StreamBuilder(stream: FirebaseFirestore.instance.collection('lostItems').snapshots(),
                builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
                  if(snapshot.hasError){
                    return Text('error');
                  }
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CupertinoActivityIndicator(),);
                  }
                  if(snapshot.data!.docs.isEmpty){
                    return Text('no data found');
                  }
                  if(snapshot != null && snapshot.data!=null){
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context,index){
                          final item = items[index];
                          return ListTile(
                            leading: Image.network(snapshot.data!.docs[index]['image_url'],height: 30.h,width: 18.w,),
                            title: Text(snapshot.data!.docs[index]['ItemName']),
                            subtitle: Text(snapshot.data!.docs[index]['location']),
                            trailing: Column(
                              children: [
                                Text(snapshot.data!.docs[index]['date']),
                                SizedBox(height: height * 0.014),
                                InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (_)=>ItemDetails(
                                        image: item.image,
                                        title: item.title,
                                        location: item.location,
                                        date: item.date,
                                      )));
                                    },
                                    child: Text('view details',style: TextStyle(color: Color(0xffFFA500),fontSize: 0.2.dp),)),
                              ],
                            ),
                          );
                        });
                  }
                  return CupertinoActivityIndicator();
                })
          ),
        ],
      )
    );
  }
}
