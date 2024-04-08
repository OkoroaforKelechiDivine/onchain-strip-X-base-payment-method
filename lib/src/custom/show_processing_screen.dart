import 'package:flutter/material.dart';

import '../../core/cores.dart';

class ProcessingDialog extends StatelessWidget {
  const ProcessingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   const AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text(
            'Transfer In Progress...',
            style: TextStyle(color: AppColors.lightBlack),
          ),
        ],
      ),
    );
  }
}
