import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/src/core/theme/theme.dart';

class CustomColor {
  static const Color white = Color(0xFFFFFFFF);
  static const Color fontBlack = Color(0xDE000000);
  static const Color fontWhite = Color(0xDEFFFFFF);
  static const Color logoBlue = Color(0xFF245f97);
  static const Color textFieldBackground = Color(0x1E000000);
  static const Color hintColor = Color(0x99000000);
  static const Color statusBarColor = Color(0x1e000000);
  static const Color snackBarColor = Colors.red;
}

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
