import 'package:flutter/material.dart';
import 'package:portfolio/src/core/utils/theme.dart';

enum ThemeEnum {
  LightTheme,
  DarkTheme,
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

final appThemeData = {
  ThemeEnum.LightTheme: CustomTheme.lightTheme,
  ThemeEnum.DarkTheme: CustomTheme.darkTheme,
};
