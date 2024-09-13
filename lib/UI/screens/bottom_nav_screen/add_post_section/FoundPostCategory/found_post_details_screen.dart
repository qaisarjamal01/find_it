import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/constants/constant_color.dart';
import '../../dashboard_screen/home_screen.dart';

class FoundPostDetailsScreen extends StatefulWidget {
  const FoundPostDetailsScreen({super.key});

  @override
  State<FoundPostDetailsScreen> createState() => _FoundPostDetailsState();
}

class _FoundPostDetailsState extends State<FoundPostDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: ConstantColors.orangeShade,
      appBar: AppBar(
        title: Text('Found Post',style: TextStyle(color: Color(0xffFFFFFF)),),
        centerTitle: true,
        backgroundColor: Color(0xff003366),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Navigator.pop(context,MaterialPageRoute(builder: (_)=>HomeScreen()));
              },child: Icon(Icons.home,color: Color(0xffFFFFFF),),
            ),
          )
        ],
      ),
      body: Center(
        child: Container(
          height: height*0.6,
          color: Color(0xffFFF3E0),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 3.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Category'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search_outlined),
                        hintText: 'Select option',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xffFFA500))
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xffFFA500))
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Location'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.location_on_outlined),
                          hintText: 'Select Location',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffFFA500)),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xffFFA500))
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Date Lost'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.date_range_outlined),
                          hintText: 'Select Date',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffFFA500)),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xffFFA500))
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: EdgeInsets.only(left: 15.w),
                      height: height*0.08,
                      width: width*0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color(0xff003366),
                      ),
                      child: Center(child: Text('Next',style: TextStyle(color: Color(0xffFFFFFF),fontSize: 0.3.dp,fontWeight: FontWeight.bold),)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
