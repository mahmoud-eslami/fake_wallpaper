import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/utils/size_config/size_config.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/appIcon.png',
          width: SizeConfig.imageSizeMultiplier * 30,
        ),
      ),
    );
  }
}
