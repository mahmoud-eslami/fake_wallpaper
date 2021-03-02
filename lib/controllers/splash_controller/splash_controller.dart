import 'package:get/get.dart';

class SplashController extends GetxController {
  bool splashFinished = false;

  @override
  void onInit() {
    super.onInit();
    splashPageOpened();
  }

  splashPageOpened() async {
    await Future.delayed(Duration(seconds: 2));
    splashFinished = true;
    update();
  }
}
