import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/recources/app_themes/app_themes.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.changeTheme(AppThemes.appLightTheme);
        },
      ),
      body: Center(
        child: Text(
          'Hi there Mahmoud!'
        ),
      ),
    );
  }
}
