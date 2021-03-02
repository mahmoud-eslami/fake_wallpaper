import 'package:flutter_wallpaper/models/category_model/category_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var categoryList = List<CategoryModel>();
  var loading = true;

  /// simulate response
  /// fill list with fake data
  fetchCategories() async {
    await Future.delayed(Duration(seconds: 3));
    CategoryModel item1 = CategoryModel(title: 'Jungle', imgPath: 'assets/images/cat3.jpg');
    CategoryModel item2 = CategoryModel(title: 'Bridge', imgPath: 'assets/images/cat4.jpg');
    CategoryModel item3 = CategoryModel(title: 'Snow', imgPath: 'assets/images/cat5.jpg');
    CategoryModel item4 = CategoryModel(title: 'Space', imgPath: 'assets/images/cat6.jpeg');
    categoryList.addAll([item1, item2, item3, item4]);
    loading = false;
    update();
  }
}
