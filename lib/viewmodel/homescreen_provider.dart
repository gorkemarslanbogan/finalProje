import 'dart:convert';
import 'package:final_project/model/StockData.dart';
import 'package:final_project/view/screen/details.dart';
import 'package:flutter/material.dart';

 class homescreen_provider extends ChangeNotifier{

  List<StockData> item = [];
  static const _path = "assets/order_product_list.json"; 
  bool isLoading = false;
  Future<void> fetchData(BuildContext context) async {
    _changeLoading();
    final dummyData = await DefaultAssetBundle.of(context).loadString(_path);
    List<dynamic> decodedJson = jsonDecode(dummyData);
    item = decodedJson.map((e) => StockData.fromJson(e)).toList();
    _changeLoading();
  }
  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}