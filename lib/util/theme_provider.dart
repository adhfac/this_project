import 'package:flutter/material.dart';
import 'light_theme.dart';
import 'dark_theme.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDark = false;

  ThemeData get theme => _isDark ? darkTheme : lightTheme;

  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
