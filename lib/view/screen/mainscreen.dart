import 'package:final_project/product/utils/app_utilts.dart';
import 'package:final_project/product/widget/appbar.dart';
import 'package:final_project/view/screen/charts_screen.dart';
import 'package:final_project/view/screen/customers.dart';
import 'package:final_project/view/screen/homescreen.dart';
import 'package:final_project/view/screen/product_info.dart';
import 'package:final_project/view/screen/settings_screen.dart';
import 'package:flutter/material.dart';



class MainScreen extends StatefulWidget {
   const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const  List<Widget> _pages  = [
    HomeScreen(),
    productInfo(),
    customerInfo(),
    ChartsScreen(),
    SettingScreen(),
  ];
  
  int _selectedIndex = 0;

  void _onTapIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
          bottomNavigationBar: _navigationBar(),
          appBar: _customAppbar(AppUtility.PageNames,_selectedIndex),
          body: _pages[_selectedIndex]));
  }

  MyAppbar _customAppbar(List<String> item, int appBarNameIndex) { 
    return MyAppbar(title: item[appBarNameIndex],enableTitle: true,);}

  BottomNavigationBar _navigationBar() {
    return BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          enableFeedback: false,
          selectedItemColor: Colors.blue.shade900,
          unselectedItemColor: Colors.grey.shade400,
          items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.check_box_outline_blank_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_search_rounded), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.add_chart_rounded), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "")
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapIndex,
        );
  }
}
