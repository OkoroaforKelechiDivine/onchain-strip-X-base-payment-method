import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';

class BuildAccountNumberTextField extends StatefulWidget {
  final Function() onCheckAccount;
  final TextEditingController textController;
  const BuildAccountNumberTextField(
      {super.key, required this.onCheckAccount, required this.textController});

  @override
  State<BuildAccountNumberTextField> createState() =>
      _BuildAccountNumberTextFieldState();
}

class _BuildAccountNumberTextFieldState
    extends State<BuildAccountNumberTextField> {
  final bool _isAccountNumberErrorVisible = true;
  final bool _isAccountNumberLengthInvalid = false;

  @override
  Widget build(BuildContext context) {
    bool isAccountNumberEmpty = widget.textController.text.isEmpty;
    bool isAccountNumberInvalid = widget.textController.text.length < 10;
    String labelText = isAccountNumberEmpty ? 'Enter Account Number' : '';

    UnderlineInputBorder customErrorBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: (isAccountNumberEmpty || isAccountNumberInvalid)
            ? AppColors.errorRed
            : AppColors.darkWhite.withOpacity(0.5),
      ),
    );
    UnderlineInputBorder customFocusedErrorBorder = const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.errorRed));
    return TextFormField(
      controller: widget.textController,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: AppColors.darkWhite,
          fontWeight: AppFontWeight.bold,
          fontSize: AppFontSize.size14,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color:
                (_isAccountNumberErrorVisible || _isAccountNumberLengthInvalid)
                    ? AppColors.errorRed
                    : AppColors.darkWhite.withOpacity(0.5),
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.darkWhite),
        ),
        errorBorder: customErrorBorder,
        focusedErrorBorder: customFocusedErrorBorder,
        contentPadding: const EdgeInsets.only(
          top: 4.0,
          bottom: 4.0,
        ),
        fillColor: AppColors.pureWhite,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      inputFormatters: [
        LengthLimitingTextInputFormatter(10),
        FilteringTextInputFormatter.digitsOnly,
      ],
      keyboardType: TextInputType.number,
      onChanged: (value) {
        if (value.length == 10) {
          widget.onCheckAccount();
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Account number should not be empty';
        } else if (value.length < 10) {
          return 'Account length is invalid';
        }
        return null;
      },
    );
  }
}
