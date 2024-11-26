import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:find_it/UI/screens/bottom_nav_screen/profile_section/profile_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'add_post_section/add_post_section.dart';
import 'admin_section/admin_section.dart';
import 'dashboard_screen/home_screen.dart';
import 'my_ads_section/my_ads_section.dart';

class BottomNavigationBarProvider with ChangeNotifier{
  List<TabItem> items = [
    TabItem(icon: Icons.home,title: 'Home'),
    TabItem(icon: Icons.update,title: 'updation'),
    TabItem(icon: Icons.add,title: 'add post'),
    TabItem(icon: Icons.admin_panel_settings_sharp,title: 'admin'),
    TabItem(icon: Icons.person,title: 'profile')
  ];

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  List<Widget> Screens = [
    HomeScreen(),
    MyAdsSection(),
    AddPostSection(),
    AdminSection(),
    ProfileSection()
  ];

  void updateSelectedIndex(int index){
    _selectedIndex = index;
    notifyListeners();
  }
}