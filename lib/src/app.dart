import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/src/views/app_nav/app_nav.dart';
import 'package:pay_me_mobile/src/views/screens/passcode/enter_passcode.dart';
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
  // Timer? _timer;
  // final _inactiveDuration = const Duration(minutes: 3);
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addObserver(this as WidgetsBindingObserver);
  // }

  // @override
  // void dispose() {
  //   _timer?.cancel();
  //   WidgetsBinding.instance.removeObserver(this);
  //   super.dispose();
  // }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.paused) {
  //     // App in background
  //     log("In background");
  //     _timer = Timer(_inactiveDuration, _restartApp);
  //   } else if (state == AppLifecycleState.resumed) {
  //     // App in foreground
  //     _timer?.cancel();
  //   }
  // }

  // void _restartApp() {
  //   Navigator.of(context).pushAndRemoveUntil(
  //     MaterialPageRoute(builder: (context) => const MyApp()),
  //     (Route<dynamic> route) => false,
  //   );
  // }

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
