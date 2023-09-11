import 'package:flutter/material.dart';
import '../../controllers/splash/Splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashController = SplashController();
    splashController.initialize(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/png/payme.png', width: 300),
          )
        ],
      ),
    );
  }
}
