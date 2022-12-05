
import 'package:final_project/product/theme/color_schemes.dart';
import 'package:flutter/material.dart';

class theme_provider extends ChangeNotifier {
  final ThemeData _lightTheme = ThemeData(colorScheme: colorSheme.lightColorScheme, useMaterial3: true);
  final ThemeData _darkTheme = ThemeData(colorScheme: colorSheme.darkColorScheme,useMaterial3: true);
  bool _isLight = false;
  void changeTheme() {
    _isLight = !_isLight;
    notifyListeners();
  }
  bool get isLight => _isLight;
  ThemeData get theme =>  _isLight ? _darkTheme : _lightTheme;
}