import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/resource/app_colors/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static final light = ThemeData.light().copyWith(
    primaryColor: AppColors.lightThemePrimaryColor,
    scaffoldBackgroundColor: AppColors.lightThemeBackgroundColor,
    accentColor: AppColors.lightThemePrimaryColor,
    textTheme: GoogleFonts.alatsiTextTheme(
      _textTheme(lightThemeTextStyle),
    ),
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
    textTheme: GoogleFonts.alatsiTextTheme(
      _textTheme(darkThemeTextStyle),
    ),
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
