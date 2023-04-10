import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Prefs {
  static late SharedPreferences _prefs;

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  static Future<bool> setBoolValue(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }
  static bool containsKey(String key) {
    return _prefs.containsKey(key);
  }
  static bool? getBoolValue(String key) {
    return _prefs.getBool(key);
  }

}