import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class constant {
  static Color primary = const Color.fromRGBO(104, 148, 84, 1);
  static late SharedPreferences prefs;
}

abstract class AppStrings {
  static const accessToken = "access-token";
  static const userId = 'user-id';
}

const List<Locale> supportedLocales = [Locale('en', 'US'), Locale('hi', 'IN')];
