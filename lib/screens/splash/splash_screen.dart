import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/splash/Splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/png/paymeLogo.png'),
          )
        ],
      ),
    );
  }
}
