import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../core/constants/constant_color.dart';
import '../../../../../components/custom_items.dart';
import '../../../profile_section/UpdateProductsScreen/update_products.dart';
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
    String? docId;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ConstantColors.orangeShade,
      appBar: AppBar(
        title: Text('All Mobiles',style: TextStyle(color: Color(0xffFFFFFF)),),
        centerTitle: true,
        backgroundColor: Color(0xff003366),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: StreamBuilder(stream: FirebaseFirestore.instance.collection('lostItems').where('categoryName', isEqualTo: 'Mobiles').snapshots(),
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
            child: StreamBuilder(stream: FirebaseFirestore.instance.collection('foundItems').where('categoryName',isEqualTo: 'Mobiles').snapshots(),
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