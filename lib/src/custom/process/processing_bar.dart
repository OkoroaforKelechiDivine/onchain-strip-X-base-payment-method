import 'package:flutter/material.dart';
import 'package:pay_me_mobile/app_config/manager/theme_manager.dart';

import '../../../core/cores.dart';

class ProcessingBar extends StatelessWidget {
  const ProcessingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.lightGreen),
    );
  }
}
