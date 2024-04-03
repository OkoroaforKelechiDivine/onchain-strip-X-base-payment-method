import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:overlay_support/overlay_support.dart';

import 'views/screens/splash/splash_screen.dart';

import '../core/constants/app_theme.dart';
import '../core/di/locator.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: ScreenUtilInit(
        builder: (context, child) {
          return MultiProvider(
            providers: allProviders,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              //navigatorKey: locator<NavigationService>().navigationKey,
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
