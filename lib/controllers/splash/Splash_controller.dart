import 'dart:async';
import 'package:get/get.dart';
import '../../views/auth_view/login_view.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(milliseconds: 4000), (){
      Get.off(() => LoginScreen());
    });
  }
}