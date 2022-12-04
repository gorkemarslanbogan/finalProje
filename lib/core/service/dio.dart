import 'package:dio/dio.dart';

class IService {
IService._();
static const String _baseurl = "https://jsonplaceholder.typicode.com/";
static  Dio? _service;
static Dio? get dio  {
  _service ??= Dio(BaseOptions(baseUrl: _baseurl));
  return _service;
  }
}

enum ServiceEndPoint {
  albums
}

extension ServiceRequestName on ServiceEndPoint {
  String get rowValue => "/$this";
}

