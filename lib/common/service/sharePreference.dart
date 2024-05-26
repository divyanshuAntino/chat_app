import 'package:shared_preferences/shared_preferences.dart';

class customSharePreference {
  void saveData(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String> readData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString(key);
    return username ?? "";
  }
}
