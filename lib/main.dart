import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pay_me_mobile/data/constants/enum/environment.dart';
import 'package:pay_me_mobile/data/constants/environment_initializer.dart';

import 'app.dart';
import 'data/utilities/secure_storage/secure_storage_init.dart';
import 'locator.dart';

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