

import 'dart:convert';

import 'package:final_project/core/service/IBaseNetwork.dart';
import 'package:final_project/model/StockData.dart';
import 'package:final_project/product/utils/app_utilts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class HomeScreenProvider extends ChangeNotifier {
  HomeScreenProvider(){
    fetchData();
  }
  List<StockData> item = [];
  bool _isLoading = false;
  Future<void> fetchData() async {
    changeLoading();
    item = await IBaseNetwork().FetchItem();
    changeLoading();
    notifyListeners();
  }
  bool get isLoading => _isLoading;
    void changeLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

}