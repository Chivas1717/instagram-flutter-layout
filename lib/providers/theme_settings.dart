import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSettings extends ChangeNotifier {
  ThemeData _selectedTheme = ThemeData.dark();
  ThemeData get selectedTheme => _selectedTheme;
  bool _isDark = false;
  bool get isDark => _isDark;

  ThemeSettings(bool isThemeDark) {
    if (isThemeDark) {
      _selectedTheme = ThemeData.dark();
      // sharedPreferences.setBool('is_dark', false);
    } else {
      _selectedTheme = ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      );
    }
  }

  void switchTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (_selectedTheme == ThemeData.dark()) {
      _selectedTheme = ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      );
      _isDark = false;
      sharedPreferences.setBool('is_dark', false);
    } else {
      _selectedTheme = ThemeData.dark();
      _isDark = true;
      sharedPreferences.setBool('is_dark', true);
    }
    notifyListeners();
  }
}
