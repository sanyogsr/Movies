import 'package:flutter/material.dart';
import 'package:movies/my_theme_preference.dart';

class ThemeNotifier extends ChangeNotifier {
  late bool _isDark;
  late MyThemePreferences _preferences;
  bool get isDark => _isDark;

  ThemeNotifier() {
    _isDark = false;
    _preferences = MyThemePreferences();
    getPreferences();
  }

  set isDark(bool value) {
    isDark = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await _preferences.getTheme();
    notifyListeners();
  }
}
