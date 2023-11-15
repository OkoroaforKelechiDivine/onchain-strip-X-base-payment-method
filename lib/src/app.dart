
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'views/screens/splash/splash_screen.dart';

import '../core/constants/app_theme.dart';
import '../core/di/locator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child){
        return  MultiProvider(
          providers: allProviders,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            //navigatorKey: locator<NavigationService>().navigationKey,
            navigatorKey: navigationService.navigatorKey,
            title: 'PayMe',
            theme: appTheme,
            home: const SplashScreen(),

          ),
        );
      },
    );
  }
}
