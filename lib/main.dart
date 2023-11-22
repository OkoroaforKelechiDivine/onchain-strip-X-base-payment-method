import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pay_me_mobile/core/constants/enum/environment.dart';
import 'package:pay_me_mobile/core/constants/environment_initializer.dart';
import 'package:pay_me_mobile/core/di/app_globals.dart';
import 'package:pay_me_mobile/data/datasources/local/base/local_storage_service.dart';

import 'src/app.dart';
import 'data/utilities/secure_storage/secure_storage_init.dart';
import 'core/di/locator.dart';

Future<void> main() async{
  setupLocator();
  await LocalStorageService.init();
  await AppGlobals.instance.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  EnvironmentInitializer.setEnvironment(Environment.DEV);
  SecureStorageInit.initSecureStorage();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      //statusBarColor: AppColors.sdp25, // status bar color
      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light,
    ),
  );
  

  runApp(
    const MyApp(),
  );
}