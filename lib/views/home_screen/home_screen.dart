import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/controllers/home_controllers/category_controller.dart';
import 'package:flutter_wallpaper/controllers/home_controllers/theme_controller.dart';
import 'package:flutter_wallpaper/resource/app_colors/app_colors.dart';
import 'package:flutter_wallpaper/resource/app_strings/app_strings.dart';
import 'package:flutter_wallpaper/utils/size_config/size_config.dart';
import 'package:flutter_wallpaper/views/wallpaper_screen/wallpaper_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          themeController.changeTheme();
        },
        child: GetBuilder(
          init: themeController,
          builder: (controller) => Icon(
            (controller.lightTheme == true) ? Icons.wb_sunny : Icons.nightlight_round,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SearchBar(),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: BestWallpaperWidget(),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: ColorToneWidget(),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: CategoryWidget(),
              ),
            ],
          ),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            AppStrings.bestWallpaper,
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 23,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Get.to(WallpaperScreen(imgPath: 'assets/images/flow.jpeg'));
              },
              child: imageWidget(),
            ),
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
          child: Image.asset(
            'assets/images/flow.jpeg',
            fit: BoxFit.fill,
          ),
        ),
      );
}

class ColorToneWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            AppStrings.colorTone,
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        ),
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

class CategoryWidget extends StatefulWidget {
  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  final categoryController = Get.put(CategoryController());

  @override
  void initState() {
    categoryController.fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: categoryController,
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppStrings.categories,
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            (controller.loading == true)
                ? SizedBox(
                    height: SizeConfig.heightMultiplier * 30,
                    child: Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        strokeWidth: 1.7,
                      ),
                    ),
                  )
                : GridView.count(
                    crossAxisCount: 2,
              children: [
                categoryItemWidget()
              ],
                  ),
          ],
        );
      },
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
            fit: BoxFit.cover,
          ),
        ),
      );
}
