
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:pay_me_mobile/screens/home_page/home_page_screen.dart';
import 'package:pay_me_mobile/screens/splash/splash_screen.dart';
import 'package:pay_me_mobile/screens/transaction_history/repeat_transaction.dart';
import 'package:pay_me_mobile/screens/transaction_history/transaction_details.dart';
import 'package:pay_me_mobile/screens/transaction_history/transaction_history.dart';
import 'package:pay_me_mobile/screens/transfer_to_bank/beneficial_detail.dart';
import 'package:pay_me_mobile/screens/transfer_to_bank/show_all_beneficiaries.dart';
import 'package:pay_me_mobile/screens/transfer_to_bank/transfer_to_bank_screen.dart';
import 'package:pay_me_mobile/views/auth_view/login_view.dart';
import 'package:pay_me_mobile/views/custom/show_pin_dialog.dart';

import 'app_config/manager/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(microseconds: 20),
      debugShowCheckedModeBanner: false,
      title: 'PayMe',
      theme: getApplicationTheme(),
      home: const SplashScreen(),

      routes: {
        "/home": (context) => const HomePageScreen(),
        "/login": (context) => const LoginScreen(),
        "/splash": (context) => const SplashScreen(),
        "/transfer": (context) => const TransferToBankScreen(),
        "/show_all_beneficiaries": (context) => ShowAllBeneficiariesScreen(banks: dummyBanks),
        "/beneficiary_details": (context) {
          final bank = ModalRoute.of(context)!.settings.arguments as DummyBank;
          return BeneficiaryDetailsScreen(bank: bank);
        },
        "/pin_dialog": (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          final amount = double.tryParse(args['amount'].replaceAll('₦', '').replaceAll(',', '').trim()) ?? 0.0;
          return PinDialog(
            amount: amount,
            accountName: args['accountName'],
          );
        },

        "/transaction_history": (context) => const TransactionHistoryScreen(),
        "/transaction_details": (context) {
          final transactionDetails = ModalRoute.of(context)!.settings.arguments as TransactionDetailsScreen;
          return TransactionDetailsScreen(
            amount: transactionDetails.amount,
            transactionTimestamp: transactionDetails.transactionTimestamp,
            accountName: transactionDetails.accountName,
            bankName: transactionDetails.bankName,
          );
        },
        "/repeat_transaction": (context) {
          final args = ModalRoute.of(context)!.settings.arguments as RepeatTransactionScreen;
          return RepeatTransactionScreen(
            amount: args.amount,
            transactionTimestamp: args.transactionTimestamp,
            accountName: args.accountName,
            description: args.description, isSent: true,
          );
        }

      },
    );
  }
}
