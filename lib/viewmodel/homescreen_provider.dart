
import 'package:final_project/core/service/IBaseNetwork.dart';
import 'package:final_project/model/StockData.dart';
import 'package:final_project/view/screen/details.dart';
import 'package:flutter/material.dart';

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
  VoidCallbackAction? gotoDetails(StockData model, BuildContext context)
  {
   Navigator.of(context).push(MaterialPageRoute(builder: ((context) => Details(model: model))));
  }
}