import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:find_it/UI/screens/bottom_nav_screen/profile_section/profile_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'add_post_section/add_post_section.dart';
import 'chat_section/chat_section.dart';
import 'dashboard_screen/home_screen.dart';
import 'my_ads_section/my_ads_section.dart';

class BottomNavigationBarProvider with ChangeNotifier{
  List<TabItem> items = [
    TabItem(icon: Icons.home,title: 'Home'),
    TabItem(icon: Icons.ads_click,title: 'My ads'),
    TabItem(icon: Icons.add,title: 'add post'),
    TabItem(icon: Icons.chat_bubble,title: 'chats'),
    TabItem(icon: Icons.person,title: 'profile')
  ];

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  List<Widget> Screens = [
    HomeScreen(),
    MyAdsSection(),
    AddPostSection(),
    ChatSection(),
    ProfileSection()
  ];

  void updateSelectedIndex(int index){
    _selectedIndex = index;
    notifyListeners();
  }
}