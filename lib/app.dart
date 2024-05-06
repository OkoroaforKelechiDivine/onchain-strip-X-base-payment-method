import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/colors.dart';
import 'package:pay_me_mobile/core/services/user_activity_timer.dart';
import 'package:pay_me_mobile/presentation/splash/splash_screen.dart';
import 'package:overlay_support/overlay_support.dart';

import '../core/constants/app_theme.dart';
import '../core/di/locator.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // UserActivityTimer().startTimer(() {
    //   navigationService.pushAndRemoveUntil(const SplashScreen());
    // });
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      toastTheme: ToastThemeData(
        background: AppColors.lightGreen,
        textColor: Colors.white,
      ),
      child: ScreenUtilInit(
        builder: (context, child) {
          return GestureDetector(
            // onTap: UserActivityTimer().resetTimer,
            // onPanUpdate: (_) => UserActivityTimer().resetTimer(),
            // onPanDown: (_) => UserActivityTimer().resetTimer(),
            // behavior: HitTestBehavior.translucent,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: navigationService.navigatorKey,
              title: 'PayMe',
              theme: appTheme,
              // home: PassCodeScreen(),
              home: const SplashScreen(),
            ),
          );
        },
      ),
    );
  }
}
