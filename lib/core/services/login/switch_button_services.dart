import 'package:learn_login_full_with_api_b02/core/interfaces/login/switch_button_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SwitchButtonServices extends ISwitchButton{
  @override
  Future<bool> getK(String key) async {
    final prefs = await SharedPreferences.getInstance();
    bool isDark = prefs.get(key) as bool;
    if (isDark == null) {
      return false;
    } else {
      return isDark;
    }
  }

  @override
  Future delete(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  @override
  Future put(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }
}