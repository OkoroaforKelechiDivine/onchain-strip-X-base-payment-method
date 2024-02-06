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

    // Remove any existing commas to avoid errors during parsing and reformatting
    String newUnformattedText = newValue.text.replaceAll(',', '');

    // Attempt to parse the new value to ensure it's numeric
    int? newIntValue = int.tryParse(newUnformattedText);
    if (newIntValue == null) {
      // If parsing fails (e.g., due to non-numeric input), return the oldValue to avoid changes
      return oldValue;
    }

    // Use NumberFormat to format the text with commas
    final newFormattedText =
        NumberFormat('#,###,###,###,###,###,###').format(newIntValue);

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
