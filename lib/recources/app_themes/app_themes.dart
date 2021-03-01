import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/recources/app_colors/app_colors.dart';

class AppThemes {
  static final light = ThemeData.light().copyWith(
    primaryColor: AppColors.lightThemePrimaryColor,
    scaffoldBackgroundColor: AppColors.lightThemeBackgroundColor,
    accentColor: AppColors.lightThemePrimaryColor,
    textTheme: _textTheme(lightThemeTextStyle),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
    ),
    floatingActionButtonTheme: _fabTheme(AppColors.lightThemePrimaryColor),
  );

  static final dark = ThemeData.dark().copyWith(
    primaryColor: AppColors.darkThemePrimaryColor,
    scaffoldBackgroundColor: AppColors.darkThemeBackgroundColor,
    accentColor: AppColors.darkThemePrimaryColor,
    textTheme: _textTheme(darkThemeTextStyle),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
    ),
    floatingActionButtonTheme: _fabTheme(AppColors.darkThemePrimaryColor),
  );

  static TextStyle lightThemeTextStyle = TextStyle(color: AppColors.lightThemeTextColor);
  static TextStyle darkThemeTextStyle = TextStyle(color: AppColors.darkThemeTextColor);

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
