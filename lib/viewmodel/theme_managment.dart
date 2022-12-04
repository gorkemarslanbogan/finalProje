
import 'package:final_project/product/theme/color_schemes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class theme_provider extends ChangeNotifier {

  bool _isLight = true;
  void changeTheme() {
    _isLight = !_isLight;
    notifyListeners();
  }
  bool get isLight => _isLight;
  ThemeData get theme =>  _isLight ? ThemeData.light() : ThemeData.dark();
}