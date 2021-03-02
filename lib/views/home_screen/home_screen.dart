import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/resource/app_colors/app_colors.dart';
import 'package:flutter_wallpaper/resource/app_strings/app_strings.dart';
import 'package:flutter_wallpaper/resource/app_themes/app_themes.dart';
import 'package:flutter_wallpaper/utils/size_config/size_config.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.changeTheme(Get.isDarkMode ? AppThemes.light : AppThemes.dark);
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            SearchBar(),
            BestWallpaperWidget(),
            ColorToneWidget(),
            CategoryWidget(),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.textFieldBackground.withOpacity(.2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        controller: searchController,
        maxLines: 1,
        cursorColor: Get.theme.primaryColor,
        decoration: InputDecoration(
          suffixIcon: const Icon(
            Icons.search,
          ),
          hintText: AppStrings.searchBarHint,
        ),
      ),
    );
  }
}

class BestWallpaperWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.bestWallpaper,
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 23,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => imageWidget(),
          ),
        ),
      ],
    );
  }

  Widget imageWidget() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          //todo: add cache network image here
          child: Image.asset(
            'assets/images/wall.jpg',
            fit: BoxFit.fill,
          ),
        ),
      );
}

class ColorToneWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(AppStrings.colorTone),
        SizedBox(
          height: SizeConfig.heightMultiplier * 9,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: SizeConfig.widthMultiplier * 13,
                  decoration: BoxDecoration(
                    color: Colors.primaries[index],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CategoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.categories,
        ),
        Wrap(
          children: [
            Row(
              children: [
                Expanded(child: categoryItemWidget()),
                Expanded(child: categoryItemWidget()),
              ],
            ),
            Row(
              children: [
                Expanded(child: categoryItemWidget()),
                Expanded(child: categoryItemWidget()),
              ],
            ),
            Row(
              children: [
                Expanded(child: categoryItemWidget()),
                Expanded(child: categoryItemWidget()),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget categoryItemWidget() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          //todo: add cache network image here
          child: Image.asset(
            'assets/images/wall.jpg',
            height: 80,
            fit: BoxFit.fill,
          ),
        ),
      );
}
