import 'package:flutter/cupertino.dart';

import '../../../../../../core/constants/colors.dart';

class BuildAmountErrorMessage extends StatefulWidget {
  const BuildAmountErrorMessage({super.key});

  @override
  State<BuildAmountErrorMessage> createState() => _BuildAmountErrorMessageState();
}

class _BuildAmountErrorMessageState extends State<BuildAmountErrorMessage> {
  String emptyAmountErrorMessage = 'Amount is empty';

  @override
  Widget build(BuildContext context) {
    if (emptyAmountErrorMessage.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          emptyAmountErrorMessage,
          style: const TextStyle(
            color: AppColors.errorRed,
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
