import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/constant_color.dart';
import 'add_post_section/add_post_section.dart';
import 'chat_section/chat_section.dart';
import 'my_ads_section/my_ads_section.dart';
import 'profile_section/profile_section.dart';
import 'dashboard_screen/home_screen.dart';

List<TabItem> items = [
  TabItem(icon: Icons.home,title: 'Home'),
  TabItem(icon: Icons.ads_click,title: 'My ads'),
  TabItem(icon: Icons.add,title: 'add post'),
  TabItem(icon: Icons.chat_bubble,title: 'chats'),
  TabItem(icon: Icons.person,title: 'profile')
];
class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int selectedIndex = 0;
  List<Widget> Screens = [
    HomeScreen(),
    MyAdsSection(),
    AddPostSection(),
    ChatSection(),
    ProfileSection()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[selectedIndex],
      backgroundColor: Color(0xffFFA500),
      bottomNavigationBar: BottomBarInspiredOutside(
        //height: 60,
        chipStyle: ChipStyle(convexBridge: true,color: Color(0xff000000),background: Color(0xffFFA500)),
        isAnimated: false,
        animated: true,
        itemStyle: ItemStyle.circle,
        borderRadius: BorderRadius.circular(15),
        items: items,
        backgroundColor: ConstantColors.primaryColor,
        color: Color(0xffFFFFFF),
        colorSelected: Color(0xffFFFFFF),
        indexSelected: selectedIndex,
        onTap: (int index) => setState(() {
          selectedIndex = index;
        }),
      ),
    );
  }
}
