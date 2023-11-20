import 'package:flutter/cupertino.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';

class BuildAccountNumberErrorMessage extends StatefulWidget {
  const BuildAccountNumberErrorMessage({super.key});

  @override
  State<BuildAccountNumberErrorMessage> createState() => _BuildAccountNumberErrorMessageState();
}

class _BuildAccountNumberErrorMessageState extends State<BuildAccountNumberErrorMessage> {
  final bool _isAccountNumberErrorVisible = true;
  final TextEditingController _accountNumberController = TextEditingController();
  final bool _isAccountNumberLengthInvalid = false;

  @override
  Widget build(BuildContext context) {
    const TextStyle errorTextStyle = TextStyle(
      color: AppColors.errorRed,
      fontWeight: AppFontWeight.medium,
      fontSize: AppFontSize.size14,
    );
    return Column(
      children: [
        Visibility(
          visible: _isAccountNumberErrorVisible && _accountNumberController.text.isEmpty,
          child: const Text(
            'Account number is empty',
            style: errorTextStyle,
          ),
        ),
        Visibility(
          visible: _isAccountNumberLengthInvalid,
          child: const Text(
            'Account length is invalid',
            style: errorTextStyle,
          ),
        ),
      ],
    );  }
}
