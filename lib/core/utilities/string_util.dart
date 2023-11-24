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
