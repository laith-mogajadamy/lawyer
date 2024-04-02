import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? preferences;

  static const String KEY_IS_First_Time = 'key_is_first_time';
  static const String usertoken = 'key_Token';
  static init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static void saveIsFirstTime(bool isFirstTime) async {
    preferences?.setBool(KEY_IS_First_Time, isFirstTime);
  }

  static bool? getIsFirstTime() {
    bool? first = preferences!.getBool(KEY_IS_First_Time);
    if (first == null) {
      return true;
    } else {
      return first;
    }
  }

  static void savetoken(String token) async {
    preferences!.setString(usertoken, token);
  }

  static String? getToken() {
    String? token = preferences!.getString(usertoken);
    if (token == null) {
      return '';
    } else {
      return token;
    }
  }
}
