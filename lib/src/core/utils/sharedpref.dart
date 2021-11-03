import 'package:portfolio/src/core/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  int get getTheme => _prefs.getInt(PREF_THEME) ?? 0;
  void setTheme(int value) => _prefs.setInt(PREF_THEME, value);
}
