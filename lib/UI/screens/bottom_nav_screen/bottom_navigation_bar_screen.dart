import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:find_it/UI/screens/bottom_nav_screen/bottom_navigation_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/constant_color.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {

  @override
  Widget build(BuildContext context) {
    final bottomNavigationBarProvider = Provider.of<BottomNavigationBarProvider>(context,listen: false);
    return Scaffold(
      body: Consumer<BottomNavigationBarProvider>(builder: (context,value,child){
        return value.Screens[value.selectedIndex];
      }),
        backgroundColor: Color(0xffFFA500),
      bottomNavigationBar:Consumer<BottomNavigationBarProvider>(
        builder: (context,value,child){
          return BottomBarInspiredOutside(
            //height: 60,
            chipStyle: ChipStyle(convexBridge: true,color: Color(0xff000000),background: Color(0xffFFA500)),
            isAnimated: false,
            animated: true,
            itemStyle: ItemStyle.circle,
            borderRadius: BorderRadius.circular(15),
            items: value.items,
            backgroundColor: ConstantColors.primaryColor,
            color: Color(0xffFFFFFF),
            colorSelected: Color(0xffFFFFFF),
            indexSelected: value.selectedIndex,
            onTap: (int index) {
              value.updateSelectedIndex(index);
            }
          );
        },
      )
    );
  }
}