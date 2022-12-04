

import 'dart:convert';

import 'package:final_project/model/StockData.dart';
import 'package:final_project/view/screen/details.dart';
import 'package:final_project/view/screen/homescreen.dart';
import 'package:final_project/viewmodel/homescreen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class homescreen_viewmodel extends State<HomeScreen> {
  
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  List<StockData> item = [];
  static const _path = "assets/order_product_list.json"; 
  bool isLoading = false;
  Future<void> fetchData() async {
    changeLoading();
    final dummyData = await DefaultAssetBundle.of(context).loadString(_path);
    List<dynamic> decodedJson = jsonDecode(dummyData);
    item = decodedJson.map((e) => StockData.fromJson(e)).toList();
    changeLoading();
    setState(() {});
  }
  VoidCallbackAction? gotoDetails(StockData model)
  {
   Navigator.of(context).push(MaterialPageRoute(builder: ((context) => Details(model: model))));
  }
  void changeLoading() {
    isLoading = !isLoading;
  }
}