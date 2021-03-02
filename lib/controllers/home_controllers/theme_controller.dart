import 'package:flutter_wallpaper/resource/app_themes/app_themes.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  bool lightTheme = true;

  changeTheme() {
    Get.changeTheme(Get.isDarkMode ? AppThemes.light : AppThemes.dark);
    lightTheme = !lightTheme;
    update();
  }
}
