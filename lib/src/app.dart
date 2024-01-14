import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';
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
  String extractVersionFromResponse(String responseBody) {
    // Use RegExp or HTML parsing to extract the version number from responseBody
    // This is an example and might not work as the Play Store page structure can change
    final versionMatch =
        RegExp(r'Current Version.+?(\d+\.\d+\.\d+)').firstMatch(responseBody);
    return versionMatch?.group(1) ?? '';
  }

  Future<void> checkAppVersion(BuildContext context) async {
    try {
      // Get current app version
      final PackageInfo info = await PackageInfo.fromPlatform();
      final currentVersion = info.version;

      // Fetch the latest version from your API or Play Store page
      final response = await Dio().get(
          "https://play.google.com/store/apps/details?id=com.systemShift.pay_me_mobile");
      final latestVersion =
          extractVersionFromResponse(response.data); // Implement this

      // Compare versions
      if (currentVersion != latestVersion) {
        // Show update dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Update Available'),
              content: Text('There is a newer version of the app available.'),
              actions: <Widget>[
                TextButton(
                  child: Text('Update'),
                  onPressed: () {
                    // Redirect to Play Store
                    // Implement this
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      // Handle errors
      print('Error checking app version: $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
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
