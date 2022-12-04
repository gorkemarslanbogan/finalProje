
import 'package:final_project/viewmodel/theme_managment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class theme_button extends StatefulWidget {
  const theme_button({super.key});

  @override
  State<theme_button> createState() => theme_buttonState();
}

class theme_buttonState extends State<theme_button> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        context.read<theme_provider>().changeTheme();
      },
      icon: context.watch<theme_provider>().isLight ?
      Icon(Icons.dark_mode) : Icon(Icons.light_mode), color: context.watch<theme_provider>().isLight ? Colors.black : Colors.amber,);
  }
}

// Switch(
//         activeColor: Colors.amber,
//         value: context.watch<theme_provider>().isLight,
//         onChanged: (bool){
//         context.read<theme_provider>().changeTheme();
//       }),
//       Icon(Icons.sunny, color: context.watch<theme_provider>().isLight ? Colors.amber : Colors.black,),