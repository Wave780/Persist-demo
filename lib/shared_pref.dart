import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static void setUserName(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<String> getUserName(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key) ?? "";
    log(value);
    return value;
  }

  static void setBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static Future<bool> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getBool(key) ?? false;
    log("USer Logged IN?\n$value");
    return value;
  }

  static void removePrefs(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static void clearPrefs(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static void setInput(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<String> getInput(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key) ?? "";
    log(value);
    return value;
  }
}
