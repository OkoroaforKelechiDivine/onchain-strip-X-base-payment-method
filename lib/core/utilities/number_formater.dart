import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NumericTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow clearing the field
    if (newValue.text.isEmpty) {
      return TextEditingValue.empty;
    }

    // Remove any existing commas and other non-numeric characters except decimal point
    String newUnformattedText =
        newValue.text.replaceAll(RegExp(r'[^0-9.]'), '');

    // Attempt to parse the new value to ensure it's a valid number
    double? newDoubleValue = double.tryParse(newUnformattedText);
    if (newDoubleValue == null) {
      // If parsing fails (e.g., due to invalid input like multiple decimal points), return the oldValue to avoid changes
      return oldValue;
    }

    // Determine if the last character is a decimal or zero following a decimal
    bool endsWithDecimal = newUnformattedText.endsWith('.');
    bool endsWithZeroAfterDecimal =
        newUnformattedText.contains('.') && newUnformattedText.endsWith('0');

    // Format the number with commas (without affecting the decimal part if it exists)
    String newFormattedText = NumberFormat('#,##0.###').format(newDoubleValue);

    // Preserving decimal point and following zeros
    if (endsWithDecimal) {
      newFormattedText += '.';
    } else if (endsWithZeroAfterDecimal) {
      int decimalPos = newUnformattedText.indexOf('.');
      int decimalCount = newUnformattedText.length - decimalPos - 1;
      newFormattedText += '.' + '0' * decimalCount;
    }

    // Ensure the cursor does not exceed the length of the new text
    int cursorPosition = newValue.selection.end;
    int offsetFromEnd = newUnformattedText.length - cursorPosition;
    int newCursorPosition = newFormattedText.length - offsetFromEnd;

    // Adjust the cursor position to ensure it's within the bounds of the new text length
    newCursorPosition = newCursorPosition > newFormattedText.length
        ? newFormattedText.length
        : newCursorPosition;
    newCursorPosition = newCursorPosition < 0 ? 0 : newCursorPosition;

    return TextEditingValue(
      text: newFormattedText,
      selection: TextSelection.collapsed(offset: newCursorPosition),
    );
  }
}
