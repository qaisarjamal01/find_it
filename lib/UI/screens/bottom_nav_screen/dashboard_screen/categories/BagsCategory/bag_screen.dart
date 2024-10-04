import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../core/constants/constant_color.dart';
import '../../../../../components/custom_items.dart';
import '../../../profile_section/update_products.dart';
import '../Item details/item_details.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({super.key});

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  List<CustomItem> items = [
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
  ];
  @override
  Widget build(BuildContext context) {
    String? docId;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ConstantColors.orangeShade,
      appBar: AppBar(
        title: Text('All Bags',style: TextStyle(color: Color(0xffFFFFFF)),),
        centerTitle: true,
        backgroundColor: Color(0xff003366),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: StreamBuilder(stream: FirebaseFirestore.instance.collection('lostItems').where('categoryName', isEqualTo: 'Bags').snapshots(),
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
                          //final item = items[index];
                          return ListTile(
                            leading: Image.network(snapshot.data!.docs[index]['image_url'],height: 30.h,width: 18.w,),
                            title: Text(snapshot.data!.docs[index]['ItemName']),
                            subtitle: Text(snapshot.data!.docs[index]['location']),
                            trailing: SizedBox(
                              width: width * 0.3,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(snapshot.data!.docs[index]['date']),
                                      SizedBox(width: width * 0.059,),
                                      InkWell(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (_) => UpdateProducts(itemName: snapshot.data!.docs[index]['ItemName'], categoryName: snapshot.data!.docs[index]['categoryName'], location: snapshot.data!.docs[index]['location'], date: snapshot.data!.docs[index]['date'], description: snapshot.data!.docs[index]['description'], docId: snapshot.data!.docs[index].id,)));
                                          },
                                          child: Icon(Icons.edit_note)),
                                    ],
                                  ),
                                  SizedBox(height: height * 0.005),
                                  Row(
                                    children: [
                                      InkWell(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (_)=>ItemDetails(
                                              image: snapshot.data!.docs[index]['image_url'],
                                              title: snapshot.data!.docs[index]['ItemName'],
                                              location: snapshot.data!.docs[index]['location'],
                                              date: snapshot.data!.docs[index]['date'],
                                            )));
                                            // Navigator.push(context, MaterialPageRoute(builder: (_)=>ItemDetails(
                                            //   image: item.image,
                                            //   title: item.title,
                                            //   location: item.location,
                                            //   date: item.date,
                                            // )));
                                          },
                                          child: Text('view details',style: TextStyle(color: Color(0xffFFA500),fontSize: 0.2.dp),)),
                                      SizedBox(width: width * 0.04),
                                      InkWell (
                                          onTap: () async {
                                            docId = snapshot.data!.docs[index].id;
                                            try {
                                              await FirebaseFirestore.instance.collection('lostItems').doc(docId).delete();
                                              print('document deleted successfully');
                                            } catch (error) {
                                              print('Error deleting document: $error');
                                            }
                                          },

                                          child: Icon(Icons.delete))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                  return CupertinoActivityIndicator();
                }),
          ),
          Expanded(
            flex: 1,
            child: StreamBuilder(stream: FirebaseFirestore.instance.collection('foundItems').where('categoryName', isEqualTo: 'Bags').snapshots(),
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
                          //final item = items[index];
                          return ListTile(
                            leading: Image.network(snapshot.data!.docs[index]['image_url'],height: 30.h,width: 18.w,),
                            title: Text(snapshot.data!.docs[index]['ItemName']),
                            subtitle: Text(snapshot.data!.docs[index]['location']),
                            trailing: SizedBox(
                              width: width * 0.3,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(snapshot.data!.docs[index]['date']),
                                      SizedBox(width: width * 0.059,),
                                      InkWell(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (_) => UpdateProducts(itemName: snapshot.data!.docs[index]['ItemName'], categoryName: snapshot.data!.docs[index]['categoryName'], location: snapshot.data!.docs[index]['location'], date: snapshot.data!.docs[index]['date'], description: snapshot.data!.docs[index]['description'], docId: snapshot.data!.docs[index].id,)));
                                          },
                                          child: Icon(Icons.edit_note)),
                                    ],
                                  ),
                                  SizedBox(height: height * 0.005),
                                  Row(
                                    children: [
                                      InkWell(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (_)=>ItemDetails(
                                              image: snapshot.data!.docs[index]['image_url'],
                                              title: snapshot.data!.docs[index]['ItemName'],
                                              location: snapshot.data!.docs[index]['location'],
                                              date: snapshot.data!.docs[index]['date'],
                                            )));
                                            // Navigator.push(context, MaterialPageRoute(builder: (_)=>ItemDetails(
                                            //   image: item.image,
                                            //   title: item.title,
                                            //   location: item.location,
                                            //   date: item.date,
                                            // )));
                                          },
                                          child: Text('view details',style: TextStyle(color: Color(0xffFFA500),fontSize: 0.2.dp),)),
                                      SizedBox(width: width * 0.04),
                                      InkWell (
                                          onTap: () async {
                                            docId = snapshot.data!.docs[index].id;
                                            try {
                                              await FirebaseFirestore.instance.collection('foundItems').doc(docId).delete();
                                              print('document deleted successfully');
                                            } catch (error) {
                                              print('Error deleting document: $error');
                                            }
                                          },

                                          child: Icon(Icons.delete))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                  return CupertinoActivityIndicator();
                }),
          ),
        ],
      )
    );
  }
}
