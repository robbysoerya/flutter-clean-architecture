import 'package:portfolio/src/core/theme/theme.dart';

int convertFromThemeEnum(ThemeEnum themeEnum) {
  switch (themeEnum) {
    case ThemeEnum.LightTheme:
      return 1;
    case ThemeEnum.DarkTheme:
      return 2;
    default:
      return 1;
  }
}

ThemeEnum convertToThemeEnum(int themeChoice) {
  switch (themeChoice) {
    case 1:
      return ThemeEnum.LightTheme;
    case 2:
      return ThemeEnum.DarkTheme;
    default:
      return ThemeEnum.LightTheme;
  }
}
