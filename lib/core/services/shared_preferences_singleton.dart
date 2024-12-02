import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesSingleton {
  static late SharedPreferences _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static Future<bool> setBool(
      {required String key, required bool value}) async {
    await _instance.setBool(key, value);
    return value;
  }

  static bool getBool(String key) {
    return _instance.getBool(key) ?? false;
  }
}
