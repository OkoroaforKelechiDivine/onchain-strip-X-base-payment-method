import 'package:flutter/cupertino.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../custom/process/processing_bar.dart';

class BuildProcessingCircle extends StatefulWidget {
  const BuildProcessingCircle({super.key});

  @override
  State<BuildProcessingCircle> createState() => _BuildProcessingCircleState();
}

class _BuildProcessingCircleState extends State<BuildProcessingCircle> {
  final bool _showLinearProcessing = false;
  final String _userName = '';

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _showLinearProcessing,
      child: Column(
        children: [
          const ProcessingBar(),
          Text(
            _userName,
            style: const TextStyle(
              color: AppColors.lightGreen,
              fontWeight: AppFontWeight.bold,
              fontSize: AppFontSize.size14,
            ),
          ),
        ],
      ),
    );
  }
}
