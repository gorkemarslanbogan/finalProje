import 'package:final_project/product/widget/divider_menu_icon.dart';
import 'package:final_project/product/widget/theme_button.dart';
import 'package:final_project/view/screen/homescreen.dart';
import 'package:final_project/viewmodel/homescreen_provider.dart';
import 'package:final_project/viewmodel/theme_managment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
     runApp(MultiProvider(
    builder: ((context, child) {
      return const MainScreen();
    }),
    providers: [
      ChangeNotifierProvider<homescreen_provider>(create: (_) => homescreen_provider()),
      ChangeNotifierProvider<theme_provider>(create: (_) => theme_provider())
      ]));
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: context.watch<theme_provider>().theme,
        home: Scaffold(
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
              children:  const [
                 _drawerheader(),
                 DividerIcon(title: "Anasayfa", icon: Icons.home_filled),
                 SizedBox(height: 20,),
                 DividerIcon(title: "Ürünler", icon: Icons.production_quantity_limits_outlined),
                 SizedBox(height: 20,),
                 DividerIcon(title: "Çalışan Performansı", icon: Icons.perm_device_information_outlined),
                 Padding(
                   padding: EdgeInsets.symmetric(horizontal:20.0),
                   child: Divider(),
                 ),
              ],
            )),
            appBar: AppBar(centerTitle: true, title: const Text('Stock Manager')),
            body: const HomeScreen()),
      );
  }

}

class _drawerheader extends StatelessWidget {
  const _drawerheader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DrawerHeader(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              CircleAvatar(child: Icon(Icons.person_rounded)),
              SizedBox(width:10 ,),
              Text("Görkem Arslanboğan")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              SizedBox(),
              theme_button(),
            ],
          ),
        ],
      ));
  }
}

