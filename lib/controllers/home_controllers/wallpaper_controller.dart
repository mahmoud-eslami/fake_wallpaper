import 'package:get/get.dart';

class WallpaperController extends GetxController {
  var wallpaperList = List<String>();
  var loading;

  fetchWallpapers() async {
    refreshData();
    await Future.delayed(Duration(seconds: 2));
    List<String> items = [
      "assets/images/wall1.jpg",
      "assets/images/wall2.jfif",
      "assets/images/wall3.jfif",
      "assets/images/wall.jpg",
      "assets/images/flow.jpeg",
    ];
    wallpaperList.addAll(items);
    wallpaperList.shuffle();
    loading = false;
    update();
  }

  refreshData() {
    loading = true;
    wallpaperList = [];
    update();
  }
}
