import 'package:flutter/material.dart';

import '../../../../../app_config/manager/font_manager.dart';
import '../../../../../core/constants/colors.dart';

class BuildAddAccountButton extends StatelessWidget {
  const BuildAddAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lightGreen,
      child: InkWell(
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(
                Icons.add,
                color: AppColors.pureWhite,
              ),
              Text(
                "Add Account",
                style: TextStyle(
                  fontWeight: AppFontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
