
import 'package:dio/dio.dart';

abstract class INetworkManager<T> {
  Future<List<T>> FetchItem();
}
