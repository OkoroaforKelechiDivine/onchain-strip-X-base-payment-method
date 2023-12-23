import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:pay_me_mobile/core/utilities/string_util.dart';

bool compareAmounts(
    {required double accountBalance, required String inputAmount}) {
  final amount = double.parse(decomposeAmount(inputAmount));
  log(amount.toString());
  return accountBalance < amount;
}

DateTime parseDateTime(String dateTimeString) {
  try {
    // Try parsing the ISO 8601 format
    return DateTime.parse(dateTimeString);
  } on FormatException {
    try {
      // Try parsing the traditional format
      return DateFormat("yyyy-MM-dd HH:mm:ss.S").parse(dateTimeString);
    } on FormatException {
      // Handle the case where the format does not match
      // You can return a default DateTime, null, or handle it as you see fit
      return DateTime.now(); // Example: using current time as default
    }
  }
}
