import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/recources/app_colors/app_colors.dart';

class AppThemes {
  static TextStyle lightThemeTextStyle = TextStyle(color: AppColors.lightThemeTextColor);
  static TextStyle darkThemeTextStyle = TextStyle(color: AppColors.darkThemeTextColor);

  static ThemeData appLightTheme = ThemeData(
    primaryColor: AppColors.lightThemePrimaryColor,
    scaffoldBackgroundColor: AppColors.lightThemeBackgroundColor,
    accentColor: AppColors.lightThemePrimaryColor,
    textTheme: _textTheme(lightThemeTextStyle),
    floatingActionButtonTheme: _fabTheme(AppColors.lightThemePrimaryColor),
  );
  static ThemeData appDarkTheme = ThemeData(
    primaryColor: AppColors.darkThemePrimaryColor,
    scaffoldBackgroundColor: AppColors.darkThemeBackgroundColor,
    accentColor: AppColors.darkThemePrimaryColor,
    textTheme: _textTheme(darkThemeTextStyle),
    floatingActionButtonTheme: _fabTheme(AppColors.darkThemePrimaryColor),
  );

  static TextTheme _textTheme(TextStyle mainStyle) {
    return TextTheme(
      bodyText1: mainStyle,
      bodyText2: mainStyle,
      button: mainStyle,
      caption: mainStyle,
      headline1: mainStyle,
      headline2: mainStyle,
      headline3: mainStyle,
      headline4: mainStyle,
      headline5: mainStyle,
      overline: mainStyle,
      subtitle1: mainStyle,
      subtitle2: mainStyle,
    );
  }

  static FloatingActionButtonThemeData _fabTheme(Color backColor) {
    return FloatingActionButtonThemeData(backgroundColor: backColor, elevation: 0.0);
  }
}
