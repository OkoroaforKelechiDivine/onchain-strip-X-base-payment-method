import 'package:flutter/cupertino.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';

class BuildUsernameText extends StatefulWidget {
  const BuildUsernameText({super.key});

  @override
  State<BuildUsernameText> createState() => _BuildUsernameTextState();
}

class _BuildUsernameTextState extends State<BuildUsernameText> {
  final String _userName = 'Glory Olaifa';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Center(
        child: Transform.translate(
          offset: const Offset(0, 9.0),
          child: Text(
            _userName,
            style: const TextStyle(
              color: AppColors.lightGreen,
              fontWeight: AppFontWeight.bold,
              fontSize: AppFontSize.size20,
            ),
          ),
        ),
      ),
    );
  }
}
