import 'package:flutter/cupertino.dart';

import '../../../../../core/constants/colors.dart';

class BuildMessageText extends StatelessWidget {
  const BuildMessageText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Tap on a Message to use transaction details",
      style: TextStyle(
        color: AppColors.lightBlack,
      ),
    );
  }
}
