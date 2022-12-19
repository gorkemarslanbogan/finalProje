import 'dart:io';
import 'package:final_project/core/service/INetworkManager.dart';
import 'package:final_project/core/service/dio.dart';
import 'package:final_project/model/StockData.dart';

class IBaseNetwork extends INetworkManager<StockData> {

  @override
  Future<List<StockData>> FetchItem() async {
    final response = await IService.dio?.get(ServiceEndPoint.json.name);
    if(response?.statusCode == HttpStatus.ok){
      final data = response?.data;
      if (data is List) {
        return data.map((e) => StockData.fromJson(e)).toList();
      }
    }
    else {
      throw Exception(HttpStatus.notFound);
    }
    return [];
  }

}