import 'package:final_project/view/screen/login_page.dart';
import 'package:final_project/product/theme/theme_managment.dart';
import 'package:final_project/viewmodel/homescreen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
     runApp(MultiProvider(
    builder: ((context, child) {
      return const FinalApp();
    }),
    providers: [
      ChangeNotifierProvider<theme_provider>(create: (_) => theme_provider()),
      ChangeNotifierProvider<HomeScreenProvider>(create: (_) => HomeScreenProvider())
      ]));
      
}
class FinalApp extends StatefulWidget {
   const FinalApp({Key? key}) : super(key: key);

  @override
  State<FinalApp> createState() => _FinalAppState();
}

class _FinalAppState extends State<FinalApp> {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: context.watch<theme_provider>().theme,
        home: const SafeArea(
          child: Scaffold(
          body: SignInPage()))
      );
  }
}