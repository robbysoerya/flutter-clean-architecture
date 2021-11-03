import 'package:portfolio/src/core/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPref {
  int get getTheme;
  void setTheme(int value);
}

class SharedPrefImpl extends SharedPref {
  final SharedPreferences prefs;

  SharedPrefImpl({required this.prefs});

  @override
  int get getTheme => prefs.getInt(PREF_THEME) ?? 0;

  @override
  void setTheme(int value) => prefs.setInt(PREF_THEME, value);
}
