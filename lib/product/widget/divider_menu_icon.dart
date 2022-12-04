import 'package:flutter/material.dart';



class DividerIcon extends StatelessWidget {
  const DividerIcon({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
                onTap: (){},
                leading:  Icon(icon, color: Colors.grey, size: 30,),
                title:  Text(title));
  }
}