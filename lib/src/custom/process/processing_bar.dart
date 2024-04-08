import 'package:flutter/material.dart';

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
