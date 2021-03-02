import 'package:get/get.dart';

class SearchController extends GetxController {
  var wallpapers = List<String>();
  var loading = true;

  fetchWallpapers() async {
    await Future.delayed(Duration(seconds: 2));
    List<String> items = [
      "assets/images/wall1.jpg",
      "assets/images/wall2.jfif",
      "assets/images/wall3.jfif",
      "assets/images/wall.jpg",
      "assets/images/wall3.jfif",
      "assets/images/wall.jpg",
      "assets/images/wall.jpg",
      "assets/images/flow.jpeg",
      "assets/images/flow.jpeg",
    ];
    wallpapers.addAll(items);
    wallpapers.shuffle();
    loading = false;
    update();
  }
}
