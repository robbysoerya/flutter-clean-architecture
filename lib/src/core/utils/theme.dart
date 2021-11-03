import 'dart:ui';

import 'package:flutter/material.dart';

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

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    // Default brightness and colors.
    brightness: Brightness.light,
    primaryColor: Colors.cyan[100],
    colorScheme: ColorScheme.light(secondary: Colors.cyan[600]!),

    // Default font family.
    fontFamily: 'Roboto',

    // Default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and etc.
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.fontBlack,
      ),
      headline2: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.fontBlack,
      ),
      bodyText1: TextStyle(fontSize: 16.0, color: CustomColor.fontBlack),
      bodyText2: TextStyle(fontSize: 16.0, color: CustomColor.fontBlack),
      button: TextStyle(
        color: CustomColor.fontBlack,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 14,
        letterSpacing: 2,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    // Default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(secondary: Colors.cyan[800]!),

    // Default font family.
    fontFamily: 'Roboto',

    // Default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and etc.
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.fontWhite,
      ),
      headline2: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: CustomColor.fontWhite,
      ),
      bodyText1: TextStyle(fontSize: 16.0, color: CustomColor.fontWhite),
      bodyText2: TextStyle(fontSize: 16.0, color: CustomColor.fontWhite),
      button: TextStyle(
        color: CustomColor.fontWhite,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 14,
        letterSpacing: 2,
      ),
    ),
  );
}

enum ThemeEnum {
  LightTheme,
  DarkTheme,
}

final appThemeData = {
  ThemeEnum.LightTheme: CustomTheme.lightTheme,
  ThemeEnum.DarkTheme: CustomTheme.darkTheme,
};

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
