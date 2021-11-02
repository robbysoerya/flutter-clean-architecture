import 'package:portfolio/src/core/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProfileLocalDataSource {
  Future<bool> updateTheme(bool isDark);
  Future<bool> getTheme();
}

class ProfileLocalDataSourceImpl extends ProfileLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProfileLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> updateTheme(bool isDark) async {
    return await sharedPreferences.setBool(IS_DARK_THEME, isDark);
  }

  @override
  Future<bool> getTheme() async {
    return sharedPreferences.getBool(IS_DARK_THEME)!;
  }
}
