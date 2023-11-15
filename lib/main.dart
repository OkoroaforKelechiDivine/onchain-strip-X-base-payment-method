import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pay_me_mobile/core/constants/enum/environment.dart';
import 'package:pay_me_mobile/core/constants/environment_initializer.dart';

import 'src/app.dart';
import 'data/utilities/secure_storage/secure_storage_init.dart';
import 'core/di/locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  EnvironmentInitializer.setEnvironment(Environment.DEV);
  SecureStorageInit.initSecureStorage();

  setupLocator();

  runApp(
    const MyApp(),
  );
}