import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:validator_demo/main.dart';

class ThemeDataProvider extends ChangeNotifier {
  ThemeData? seletedTheme;
  SharedPreferences? prefs;

  ThemeData dark = ThemeData.dark().copyWith();

  ThemeData light = ThemeData.light().copyWith();

  ThemeDataProvider(bool darkThemeOn) {
    seletedTheme = darkThemeOn ? dark : light;
  }

  Future<void> swapTheme() async {
    prefs = await SharedPreferences.getInstance();

    if (seletedTheme == dark) {
      seletedTheme = light;
      await prefs!.setBool(AppKeys.darkMode, false);
    } else {
      seletedTheme = dark;
      await prefs!.setBool(AppKeys.darkMode, true);
    }
    notifyListeners();
  }

  //ThemeData getTheme() => seletedTheme;
}
