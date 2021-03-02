import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/utils/size_config/size_config.dart';
import 'package:flutter_wallpaper/views/home_screen/home_screen.dart';
import 'package:get/get.dart';

import 'resource/app_strings/app_strings.dart';
import 'resource/app_themes/app_themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppStrings.appName,
              theme: AppThemes.light,
              darkTheme: AppThemes.dark,
              home: HomeScreen(),
            );
          },
        );
      },
    );
  }
}
