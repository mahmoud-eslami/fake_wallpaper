import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/resource/app_colors/app_colors.dart';
import 'package:flutter_wallpaper/resource/app_strings/app_strings.dart';
import 'package:flutter_wallpaper/utils/size_config/size_config.dart';
import 'package:get/get.dart';

class WallpaperScreen extends StatelessWidget {
  final String imgPath;

  const WallpaperScreen({Key key, @required this.imgPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            imgPath,
            width: SizeConfig.widthMultiplier * 100,
            height: SizeConfig.heightMultiplier * 100,
            fit: BoxFit.fill,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WallpaperButtonWidget(
                  onTap: () {},
                  icon: Icons.info,
                  iconTitle: AppStrings.info,
                  buttonColor: AppColors.darkThemeTextColor.withOpacity(.6),
                ),
                WallpaperButtonWidget(
                  onTap: () {},
                  icon: Icons.save_alt,
                  iconTitle: AppStrings.save,
                  buttonColor: AppColors.darkThemeTextColor.withOpacity(.6),
                ),
                WallpaperButtonWidget(
                  onTap: () {},
                  icon: Icons.brush_outlined,
                  iconTitle: AppStrings.apply,
                  buttonColor: Get.theme.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WallpaperButtonWidget extends StatelessWidget {
  final IconData icon;
  final String iconTitle;
  final Color buttonColor;
  final Function onTap;

  const WallpaperButtonWidget({
    Key key,
    @required this.icon,
    @required this.iconTitle,
    @required this.buttonColor,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          height: SizeConfig.widthMultiplier * 20,
          width: SizeConfig.widthMultiplier * 20,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: AppColors.lightThemeTextColor,
              ),
              Text(
                iconTitle,
                style: TextStyle(
                  color: AppColors.lightThemeTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
