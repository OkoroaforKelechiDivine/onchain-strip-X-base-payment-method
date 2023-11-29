import 'package:flutter/cupertino.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_power/buy_power_view_model.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_power/components/package_dropdown.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';

class BuildPackage extends StatelessWidget {
  final BuyPowerViewModel model;
  const BuildPackage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "Package",
                style: TextStyle(
                  color: AppColors.lightBlack,
                  fontWeight: AppFontWeight.bold,
                  fontSize: AppFontSize.size16,
                ),
              ),
            ),
          ),
          BuildPackageDropdown(
            model: model,
          ),
        ],
      ),
    );
  }
}
