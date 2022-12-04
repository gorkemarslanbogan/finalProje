import 'package:final_project/product/widget/appbar.dart';
import 'package:final_project/product/widget/divider_menu_icon.dart';
import 'package:final_project/product/widget/theme_button.dart';
import 'package:final_project/view/screen/homescreen.dart';
import 'package:final_project/viewmodel/theme_managment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
     runApp(MultiProvider(
    builder: ((context, child) {
      return const MainScreen();
    }),
    providers: [
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
        home: const Scaffold(
            appBar: MyAppbar(),
            body: HomeScreen()),
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

