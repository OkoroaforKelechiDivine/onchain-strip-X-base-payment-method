import 'package:flutter/material.dart';
import 'package:pay_me_mobile/data/constants/enum/environment.dart';
import 'package:pay_me_mobile/data/constants/environment_initializer.dart';

import 'app.dart';

void main() {
  EnvironmentInitializer.setEnvironment(Environment.DEV);
  print(EnvironmentInitializer.BASE_URL);
  runApp(const MyApp());
}
