
import 'package:flutter/material.dart';
import 'package:pay_me_mobile/data/screens/pos/set_pos_screen.dart';
import 'package:provider/provider.dart';

import 'app_config/manager/theme_manager.dart';
import 'data/custom/confirm_page.dart';
import 'data/custom/show_pin_dialog.dart';
import 'data/screens/buy_airtime/buy_airtime_screen.dart';
import 'data/screens/buy_power/buy_power_screen.dart';
import 'data/screens/home_page/home_page_screen.dart';
import 'data/screens/login/set_login_screen.dart';
import 'data/screens/outlet/outlet_screen.dart';
import 'data/screens/passcode/enter_passcode.dart';
import 'data/screens/passcode/set_pass_code.dart';
import 'data/screens/raise_payment/raise_payment.dart';
import 'data/screens/splash/splash_screen.dart';
import 'data/screens/transaction_history/repeat_transaction.dart';
import 'data/screens/transaction_history/transaction_details.dart';
import 'data/screens/transaction_history/transaction_history.dart';
import 'data/screens/transfer_to_bank/send_money.dart';
import 'data/screens/transfer_to_bank/show_all_recent_transaction.dart';
import 'data/screens/transfer_to_bank/transfer_to_bank_screen.dart';
import 'data/screens/tv/cable_tv.dart';
import 'locator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: allProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PayMe',
        theme: getApplicationTheme(),
        home: const SplashScreen(),

        routes: {
          "/home": (context) => const HomePageScreen(),
          "/login": (context) => const LoginScreen(),
          "/splash": (context) => const SplashScreen(),
          "/raise_payment": (context) => const RaisePaymentScreen(),
          "/buy_power": (context) => const BuyPowerScreen(),
          "/transfer": (context) => const TransferToBankScreen(),
          "/show_all_beneficiaries": (context) => ShowAllRecentTransactionsScreen(banks: dummyBanks),
          "/pin_dialog": (context) {
            final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
            final amount = double.tryParse(args['amount'].replaceAll('₦', '').replaceAll(',', '').trim()) ?? 0.0;
            return PinDialog(
              amount: amount,
              accountName: args['accountName'],
            );
          },
          "/confirm_page": (context) => const ConfirmPaymentScreen(),
          "/cable_tv": (context) => const CableTvScreen(),
          "/enter_pass_code": (context) => const EnterPassCodeScreen(),
          "/set_pass_code": (context) => const SetPassCodeScreen(),
          "/pos_device": (context) => const PosDeviceScreen(),
          "/outlet": (context) => const OutletScreen(),
          "/beneficiary_details": (context) {
            final bank = ModalRoute.of(context)!.settings.arguments as DummyBank;
            return SendMoneyScreen(bank: bank);
          },
          "/buy_airtime": (context) => const BuyAirtimeScreen(),
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
      ),
    );
  }
}
