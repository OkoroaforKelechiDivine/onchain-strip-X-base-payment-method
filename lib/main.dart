import 'package:flutter/material.dart';
import 'package:pay_me_mobile/token/token_provider.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TokenProvider(),
      child: const MyApp(),
    ),
  );
}