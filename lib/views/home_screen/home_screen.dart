import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/controllers/home_controllers/category_controller.dart';
import 'package:flutter_wallpaper/controllers/home_controllers/theme_controller.dart';
import 'package:flutter_wallpaper/controllers/home_controllers/wallpaper_controller.dart';
import 'package:flutter_wallpaper/models/category_model/category_model.dart';
import 'package:flutter_wallpaper/resource/app_colors/app_colors.dart';
import 'package:flutter_wallpaper/resource/app_strings/app_strings.dart';
import 'package:flutter_wallpaper/utils/size_config/size_config.dart';
import 'package:flutter_wallpaper/views/search_screen/search_screen.dart';
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
            (controller.lightTheme == true)
                ? Icons.wb_sunny
                : Icons.nightlight_round,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          hintText: AppStrings.searchBarHint,
        ),
      ),
    );
  }
}

class BestWallpaperWidget extends StatefulWidget {
  @override
  _BestWallpaperWidgetState createState() => _BestWallpaperWidgetState();
}

class _BestWallpaperWidgetState extends State<BestWallpaperWidget> {
  final wallpaperController = Get.put(WallpaperController());
  List<String> items = [];

  @override
  void initState() {
    wallpaperController.fetchWallpapers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.bestWallpaper,
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              FlatButton(
                onPressed: () {
                  wallpaperController.fetchWallpapers();
                },
                child: Text(
                  AppStrings.updateWallpaper,
                  style: TextStyle(
                    fontSize: 15,
                    color: Get.theme.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 23,
          child: GetBuilder(
            init: wallpaperController,
            builder: (controller) {
              if (controller.loading == true) {
                return Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    strokeWidth: 1.7,
                  ),
                );
              } else {
                items = controller.wallpaperList;
              }
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Get.to(WallpaperScreen(imgPath: items[index]));
                  },
                  child: imageWidget(items[index]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget imageWidget(String img) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.asset(
            img,
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
        List<CategoryModel> items = controller.categoryList;
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
                : SizedBox(
                    height: SizeConfig.heightMultiplier * 27,
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Get.to(
                            SearchScreen(
                              searchedTitle: items[index].title,
                            ),
                          );
                        },
                        child: categoryItemWidget(items[index].imgPath),
                      ),
                    ),
                  )
          ],
        );
      },
    );
  }

  Widget categoryItemWidget(String imagePath) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.asset(
            imagePath,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
      );
}
