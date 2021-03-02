import 'package:get/get.dart';

class SplashController extends GetxController {
  bool splashFinished = false.obs();

  @override
  void onInit() {
    super.onInit();
    splashPageOpened();
  }

  splashPageOpened() async {
    await Future.delayed(Duration(seconds: 2));
    splashFinished = true;
  }
}
