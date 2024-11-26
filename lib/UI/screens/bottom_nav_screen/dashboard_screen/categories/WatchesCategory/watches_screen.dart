
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../core/constants/constant_color.dart';
import '../../../../../components/custom_items.dart';
import '../../../profile_section/UpdateProductsScreen/update_products.dart';
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
    String? docId;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
              flex: 1,
              child: StreamBuilder(stream: FirebaseFirestore.instance.collection('lostItems').where('categoryName', isEqualTo: 'Watches').snapshots(),
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
            child: StreamBuilder(stream: FirebaseFirestore.instance.collection('foundItems').where('categoryName',isEqualTo: 'Watches').snapshots(),
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

