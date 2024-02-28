import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkModeEnabled = false;

  bool get isDarkModeEnabled => _isDarkModeEnabled;


  void toggleDarkTheme() {
    _isDarkModeEnabled = !_isDarkModeEnabled;
    notifyListeners();
  }

}