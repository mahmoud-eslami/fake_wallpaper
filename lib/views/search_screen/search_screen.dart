import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_wallpaper/controllers/search_controllers/search_controller.dart';
import 'package:flutter_wallpaper/utils/size_config/size_config.dart';
import 'package:flutter_wallpaper/views/wallpaper_screen/wallpaper_screen.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  final String searchedTitle;

  const SearchScreen({
    Key key,
    @required this.searchedTitle,
  }) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = Get.put(SearchController());
  List<String> wallpapers = [];

  @override
  void initState() {
    searchController.fetchWallpapers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder(
          init: searchController,
          builder: (controller) {
            wallpapers = controller.wallpapers;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.searchedTitle,
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    wallpapers.length.toString() + ' wallpaper available',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  (controller.loading == true)
                      ? Expanded(
                          child: Container(
                            child: Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 1.7,
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          child: StaggeredGridView.countBuilder(
                            crossAxisCount: 4,
                            itemCount: wallpapers.length,
                            itemBuilder: (BuildContext context, int index) =>
                                GestureDetector(
                              onTap: () {
                                Get.to(WallpaperScreen(
                                  imgPath: wallpapers[index],
                                ));
                              },
                              child: Material(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image.asset(
                                  wallpapers[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            staggeredTileBuilder: (int index) =>
                                StaggeredTile.count(2, index.isEven ? 3 : 2),
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                          ),
                        )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
