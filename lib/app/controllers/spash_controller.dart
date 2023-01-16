import 'dart:async';

import 'package:get/get.dart';
import 'package:toy_app/app/screens/home/home_page.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Timer(
      const Duration(milliseconds: 2000),
      () => Get.offAll(() =>  HomePage(), transition: Transition.fade),
    );
    super.onInit();
  }
}
