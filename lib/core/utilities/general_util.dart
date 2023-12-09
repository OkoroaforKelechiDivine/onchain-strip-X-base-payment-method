import 'dart:developer';

import 'package:pay_me_mobile/core/utilities/string_util.dart';

bool compareAmounts(
    {required double accountBalance, required String inputAmount}) {
  final amount = double.parse(decomposeAmount(inputAmount));
  log(amount.toString());
  return accountBalance < amount;
}
