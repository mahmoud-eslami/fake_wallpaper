import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/recources/app_strings/app_strings.dart';
import 'package:flutter_wallpaper/recources/app_themes/app_themes.dart';
import 'package:flutter_wallpaper/views/home_screen/home_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      theme: AppThemes.appLightTheme,
      home: HomeScreen(),
    );
  }
}
