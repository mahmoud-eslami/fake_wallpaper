import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/recources/app_colors/app_colors.dart';
import 'package:flutter_wallpaper/recources/app_strings/app_strings.dart';
import 'package:flutter_wallpaper/recources/app_themes/app_themes.dart';
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
          height: 200,
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
            width: 100,
            fit: BoxFit.fill,
          ),
        ),
      );
}

class CategoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.categories,
        ),
      ],
    );
  }
}
