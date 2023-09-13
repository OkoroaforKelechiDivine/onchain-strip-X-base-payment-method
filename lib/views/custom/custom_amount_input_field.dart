class AmountFormatter {
  static String formatAmount(String amount) {
    amount = amount.replaceAll("₦", "");
    amount = amount.replaceAll(",", "");

    if (amount.isEmpty) {
      return "";
    }

    // Remove any non-digit characters
    amount = amount.replaceAll(RegExp(r'[^0-9]'), '');

    final parts = amount.split('.');
    if (parts.length > 1) {
      // If there are decimal places, format the integer part
      parts[0] = parts[0].replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (match) => '${match[1]},',
      );
    } else {
      // If there are no decimal places, format the whole part
      parts[0] = parts[0].replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (match) => '${match[1]},',
      );
    }
    return '₦ ${parts.join('.')}';
  }
}
