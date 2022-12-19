import 'package:final_project/model/StockData.dart';
import 'package:final_project/view/screen/details.dart';
import 'package:final_project/view/screen/homescreen.dart';
import 'package:flutter/material.dart';

abstract class homescreen_viewmodel extends State<HomeScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   HomeScreenProvider();
  // }
  // List<StockData> item = [];
  // bool isLoading = false;
  // Future<void> fetchData() async {
  //   changeLoading();
  //  item = await IBaseNetwork().FetchItem();
  //   changeLoading();
  //   setState(() {});
  // }

  // void changeLoading() {
  //   isLoading = !isLoading;
    
  // }

  // static Future<List<StockData>> _getData(List<dynamic> data) async {
  //  return data.map((e) => StockData.fromJson(e)).toList(); 
  // }
  
  VoidCallbackAction? gotoDetails(StockData model)
  {
   Navigator.of(context).push(MaterialPageRoute(builder: ((context) => Details(model: model))));
  }



}