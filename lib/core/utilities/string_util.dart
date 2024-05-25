import 'package:intl/intl.dart';

String formatBalance(double balance) {
  String formattedBalance = balance.toStringAsFixed(2);
  List<String> parts = formattedBalance.split('.');
  String integerPart = parts[0];
  String decimalPart = parts.length > 1 ? '.${parts[1]}' : '';

  String result = '';
  int count = 0;

  for (int i = integerPart.length - 1; i >= 0; i--) {
    result = integerPart[i] + result;
    count++;
    if (count % 3 == 0 && i != 0) {
      result = ',$result';
    }
  }
  return result + decimalPart;
}

String decomposeAmount(String amount) {
  String cleanValue = amount.replaceAll(RegExp(r'[^\d]'), '');
  return cleanValue;
}

String formartDate(String dateStr) {
  DateTime dateTime = DateTime.parse(dateStr);

  // Using DateFormat from the intl package to format the date
  String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);

  return formattedDate; // Output: 2006-01-02
}

String formatPhoneNumber(String phoneNumber) {
  // Remove any non-digit characters from the input
  phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

  // Check if the phone number starts with '0'
  if (phoneNumber.startsWith('0')) {
    phoneNumber = '+234' + phoneNumber.substring(1);
  } else if (phoneNumber.length == 10) {
    // Check if the phone number has 10 digits
    phoneNumber = '+234' + phoneNumber;
  } else {
    // If the input does not match expected formats, return the original input
    return phoneNumber;
  }

  return phoneNumber;
}
