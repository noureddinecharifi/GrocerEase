import 'package:flutter/material.dart';

import '../utils/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightTheme;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    themeData = _themeData == lightTheme ? darkMode : lightTheme;
    
  }
  IconData getThemeIcon() {
    return _themeData == lightTheme ? Icons.brightness_high : Icons.brightness_3;
  }
}
