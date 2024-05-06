import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pay_me_mobile/app.dart';
import 'package:pay_me_mobile/core/constants/enum/environment.dart';
import 'package:pay_me_mobile/core/constants/environment_initializer.dart';
import 'package:pay_me_mobile/core/di/app_globals.dart';
import 'package:pay_me_mobile/core/services/messaging.dart';
import 'package:pay_me_mobile/core/services/notification_service.dart';
import 'package:pay_me_mobile/data/datasources/local/base/local_storage_service.dart';
import 'package:pay_me_mobile/firebase_options.dart';

import 'core/di/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      //statusBarColor: AppColors.sdp25, // status bar color
      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light,
    ),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  await LocalStorageService.init();
  await AppGlobals.instance.init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  EnvironmentInitializer.setEnvironment(Environment.DEV);

  final notificationService = NotificationService();
  //final messaging = Messaging();
  notificationService.requestPermission();
  Messaging.registerNotification();
  Messaging.setupInteractedMessage();
  Messaging.checkForInitialMessage();
  notificationService.getToken();

  runApp(
    const MyApp(),
  );
}
