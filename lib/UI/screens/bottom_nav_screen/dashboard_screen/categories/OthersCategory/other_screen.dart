import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../core/constants/constant_color.dart';
import '../../../../../components/custom_items.dart';
import '../../../profile_section/UpdateProductsScreen/update_products.dart';
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
    String? docId;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ConstantColors.orangeShade,
      appBar: AppBar(
        title: Text('Others',style: TextStyle(color: Color(0xffFFFFFF)),),
        centerTitle: true,
        backgroundColor: Color(0xff003366),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: StreamBuilder(stream: FirebaseFirestore.instance.collection('lostItems').where('categoryName', isEqualTo: 'Others').snapshots(),
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
                                          image: snapshot.data!.docs[index]['image_url'],
                                          title: snapshot.data!.docs[index]['ItemName'],
                                          location: snapshot.data!.docs[index]['location'],
                                          date: snapshot.data!.docs[index]['date'],
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
          Expanded(
            flex: 1,
            child: StreamBuilder(stream: FirebaseFirestore.instance.collection('foundItems').where('categoryName',isEqualTo: 'Others').snapshots(),
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
                                        image: snapshot.data!.docs[index]['image_url'],
                                        title: snapshot.data!.docs[index]['ItemName'],
                                        location: snapshot.data!.docs[index]['location'],
                                        date: snapshot.data!.docs[index]['date'],
                                      )));
                                    },
                                    child: Text('view details',style: TextStyle(color: Color(0xffFFA500),fontSize: 0.2.dp),)),
                              ],
                            ),
                          );
                        });
                  }
                  return CupertinoActivityIndicator();
                }),
          )
        ],
      )
    );
  }
}