import 'package:get/get.dart';

class SplashController extends GetxController {
  bool splashFinished = false;

  @override
  void onInit() {
    splashPageOpened();

    super.onInit();
  }

  splashPageOpened() async {
    await Future.delayed(Duration(seconds: 3));
    splashFinished = true;
    update();
  }
}
