

import 'dart:convert';

import 'package:final_project/model/StockData.dart';
import 'package:final_project/product/utils/app_utilts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class HomeScreenProvider extends ChangeNotifier {
  List<StockData> item = [];
  bool _isLoading = false;
  Future<void> fetchData(BuildContext context) async {
    changeLoading();
    final dummyData = await DefaultAssetBundle.of(context).loadString(AppUtility.LOCAL_DATA_PATH);
    List<dynamic> decodedJson = jsonDecode(dummyData);
    item = await compute(_getData, decodedJson);
    changeLoading();
  }
  static Future<List<StockData>> _getData(List<dynamic> data) async {
   return data.map((e) => StockData.fromJson(e)).toList(); 
  }
  bool get isLoading => _isLoading;
    void changeLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

}