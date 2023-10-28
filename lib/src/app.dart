
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/data/screens/pos/set_pos_screen.dart';
import 'package:provider/provider.dart';

import '../app_config/manager/theme_manager.dart';
import '../data/custom/confirm_page.dart';
import '../data/custom/show_pin_dialog.dart';
import 'views/screens/transactions/buy_airtime/buy_airtime_screen.dart';
import 'views/screens/transactions/buy_power/buy_power_screen.dart';
import 'views/screens/home/home_page_screen.dart';
import 'views/screens/auth/login_screen.dart';
import '../data/screens/outlet/outlet_screen.dart';
import '../data/screens/passcode/enter_passcode.dart';
import '../data/screens/passcode/set_pass_code.dart';
import '../data/screens/raise_payment/raise_payment.dart';
import 'views/screens/splash/splash_screen.dart';
import '../data/screens/transaction_history/repeat_transaction.dart';
import '../data/screens/transaction_history/transaction_details.dart';
import 'views/screens/transaction_history/transaction_history.dart';
import '../data/screens/transfer_to_bank/send_money.dart';
import '../data/screens/transfer_to_bank/show_all_recent_transaction.dart';
import 'views/screens/transactions/transfer/transfer_to_bank_screen.dart';
import '../data/screens/tv/cable_tv.dart';
import 'core/app_services/navigator_service.dart';
import 'core/constants/app_theme.dart';
import 'locator.dart';

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
            navigatorKey: locator<NavigationService>().navigationKey,
            title: 'PayMe',
            theme: appTheme,
            home: const SplashScreen(),

          ),
        );
      },
    );
  }
}
