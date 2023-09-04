
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:pay_me_mobile/screens/home_page/home_page_screen.dart';
import 'package:pay_me_mobile/screens/splash/splash_screen.dart';
import 'package:pay_me_mobile/screens/transfer_to_bank/transfer_to_bank_screen.dart';
import 'package:pay_me_mobile/views/auth_view/login_view.dart';

import 'app_config/manager/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(microseconds: 20),
      debugShowCheckedModeBanner: false,
      title: 'PayMe',
      theme: getApplicationTheme(),
      home: const SplashScreen(),

      routes: {
        "/home": (context) => const HomePageScreen(),
        "/login": (context) => const LoginScreen(),
        "/splash": (context) => const SplashScreen(),
        "/transfer": (context) => const TransferToBankScreen(),
      },
    );
  }
}
