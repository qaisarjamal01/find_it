import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/constants/constant_color.dart';
import '../dashboard_screen/categories/Item details/item_details.dart';
import '../profile_section/update_products.dart';

class MyAdsSection extends StatefulWidget {
  const MyAdsSection({super.key});

  @override
  State<MyAdsSection> createState() => _MyAdsSectionState();
}

class _MyAdsSectionState extends State<MyAdsSection> {
  String selectedCategory = 'lostItems'; // Default category

  @override
  Widget build(BuildContext context) {
    String? docId;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ConstantColors.orangeShade,
      appBar: AppBar(
        title: const Text(
          'My Ads',
          style: TextStyle(color: Color(0xffFFFFFF)),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff003366),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedCategory = 'lostItems'; // Show lost items
                  });
                },
                child: Text(
                  'Lost',
                  style: TextStyle(color: const Color(0xffFFA500), fontSize: 3.h),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedCategory = 'foundItems'; // Show found items
                  });
                },
                child: Text(
                  'Found',
                  style: TextStyle(color: const Color(0xffFFA500), fontSize: 3.h),
                ),
              ),
            ],
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection(selectedCategory).where('user_id', isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots(),
              builder: (context,   snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('Error occurred!'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CupertinoActivityIndicator());
                }
                if (snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No data found'));
                }
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network(
                        snapshot.data!.docs[index]['image_url'],
                        height: 30.h,
                        width: 18.w,
                      ),
                      title: Text(snapshot.data!.docs[index]['ItemName']),
                      subtitle: Text(snapshot.data!.docs[index]['location']),
                      trailing: SizedBox(
                        width: width * 0.3,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(snapshot.data!.docs[index]['date']),
                                SizedBox(width: width * 0.059),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => UpdateProducts(
                                          itemName: snapshot.data!.docs[index]['ItemName'],
                                          categoryName: snapshot.data!.docs[index]['categoryName'],
                                          location: snapshot.data!.docs[index]['location'],
                                          date: snapshot.data!.docs[index]['date'],
                                          description: snapshot.data!.docs[index]['description'],
                                          docId: snapshot.data!.docs[index].id,
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Icon(Icons.edit_note),
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.005),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ItemDetails(
                                          image: snapshot.data!.docs[index]['image_url'],
                                          title: snapshot.data!.docs[index]['ItemName'],
                                          location: snapshot.data!.docs[index]['location'],
                                          date: snapshot.data!.docs[index]['date'],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'view details',
                                    style: TextStyle(color: const Color(0xffFFA500), fontSize: 0.2.dp),
                                  ),
                                ),
                                SizedBox(width: width * 0.04),
                                InkWell(
                                  onTap: () async {
                                    docId = snapshot.data!.docs[index].id;
                                    try {
                                      await FirebaseFirestore.instance
                                          .collection(selectedCategory)
                                          .doc(docId)
                                          .delete();
                                      print('Document deleted successfully');
                                    } catch (error) {
                                      print('Error deleting document: $error');
                                    }
                                  },
                                  child: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

