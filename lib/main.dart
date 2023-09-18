import 'package:flutter/material.dart';
import 'package:pay_me_mobile/views/token/UserToken.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
          create: (_) => UserToken(),
          child:const MyApp()
      )
  );
}
