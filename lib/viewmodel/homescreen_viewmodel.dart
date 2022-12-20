import 'package:final_project/model/StockData.dart';
import 'package:final_project/view/screen/details.dart';
import 'package:final_project/view/screen/homescreen.dart';
import 'package:flutter/material.dart';

abstract class homescreen_viewmodel extends State<HomeScreen> {
  VoidCallbackAction? gotoDetails(StockData model)
  {
   Navigator.of(context).push(MaterialPageRoute(builder: ((context) => Details(model: model))));
  }
}