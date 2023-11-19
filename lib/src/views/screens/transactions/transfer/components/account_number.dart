import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';

class BuildAccountNumberTextField extends StatefulWidget {
  const BuildAccountNumberTextField({super.key});

  @override
  State<BuildAccountNumberTextField> createState() => _BuildAccountNumberTextFieldState();
}

class _BuildAccountNumberTextFieldState extends State<BuildAccountNumberTextField> {
  final TextEditingController _accountNumberController = TextEditingController();
  final bool _isAccountNumberErrorVisible = true;
  final bool _isAccountNumberLengthInvalid = false;

  @override
  Widget build(BuildContext context) {
    bool isAccountNumberEmpty = _accountNumberController.text.isEmpty;
    bool isAccountNumberInvalid = _accountNumberController.text.length < 10;
    String labelText = isAccountNumberEmpty ? 'Enter Account Number' : '';

    UnderlineInputBorder customErrorBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: (isAccountNumberEmpty || isAccountNumberInvalid) ? AppColors.errorRed : AppColors.darkWhite.withOpacity(0.5),
      ),
    );
    UnderlineInputBorder customFocusedErrorBorder = const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.errorRed)
    );
    return TextFormField(
      controller: _accountNumberController,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: AppColors.darkWhite,
          fontWeight: AppFontWeight.bold,
          fontSize: AppFontSize.size14,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: (_isAccountNumberErrorVisible || _isAccountNumberLengthInvalid) ? AppColors.errorRed : AppColors.darkWhite.withOpacity(0.5),
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
        // setState(() {
        //   if (value.isEmpty) {
        //     _isAccountNumberErrorVisible = true;
        //     _isAccountNumberLengthInvalid = false;
        //     _userName = '';
        //   } else if (value.length != 10) {
        //     _isAccountNumberErrorVisible = false;
        //     _isAccountNumberLengthInvalid = true;
        //     _userName = '';
        //   } else {
        //     _showLinearProcessing = true;
        //     _isAccountNumberErrorVisible = false;
        //     _isAccountNumberLengthInvalid = false;
        //     Future.delayed(const Duration(seconds: 3), () async {
        //       try {
        //         String accountType = "inter";
        //         String beneficiaryAccount = await TransactionHelper.fetchBeneficiaryAccount(context, value, _selectedBankController.text, accountType);
        //         _userName = beneficiaryAccount;
        //       } catch (e) {
        //         _isAccountNumberErrorVisible = true;
        //         _userName = 'Account not found';
        //       } finally {
        //         _showLinearProcessing = false;
        //       }
        //       setState(() {});
        //     });
        //   }
        // });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Account number should not be empty';
        } else if (value.length < 10) {
          return 'Account length is invalid';
        }
        return null;
      },
    );  }
}
