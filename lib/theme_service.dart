import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService extends ChangeNotifier {
  final String _key = "theme_mode";
  SharedPreferences? _prefs;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool isDarkMode() {
    return _prefs?.getBool(_key) ?? false;
  }

  void setDarkMode(bool value) {
    _prefs?.setBool(_key, value);
    notifyListeners();
  }
}
