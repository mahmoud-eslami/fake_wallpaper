import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/utils/size_config/size_config.dart';
import 'package:flutter_wallpaper/views/home_screen/home_screen.dart';
import 'package:flutter_wallpaper/views/splash_screen/splash_screen.dart';
import 'package:get/get.dart';
import 'controllers/splash_controller/splash_controller.dart';
import 'resource/app_strings/app_strings.dart';
import 'resource/app_themes/app_themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final splashController = Get.put(SplashController());

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
              home: GetBuilder(
                init: splashController,
                  builder: (controller) {
                    if (controller.splashFinished == true) {
                      return HomeScreen();
                    }
                    return SplashScreen();
                  }),
            );
          },
        );
      },
    );
  }
}
