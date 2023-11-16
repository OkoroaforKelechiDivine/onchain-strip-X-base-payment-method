import 'package:flutter/material.dart';

import '../../../../../app_config/manager/font_manager.dart';
import '../../../../../core/constants/colors.dart';

class BuildEditBeneficiaryButton extends StatelessWidget {
  const BuildEditBeneficiaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Card(
        color: AppColors.lightGreen,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(
                  Icons.edit,
                  color: AppColors.pureWhite,
                ),
                Text(
                  "Edit Beneficiary",
                  style: TextStyle(
                    fontWeight: AppFontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
