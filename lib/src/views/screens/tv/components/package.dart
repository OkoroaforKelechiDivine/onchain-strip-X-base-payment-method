import 'package:flutter/cupertino.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_power/components/package_dropdown.dart';
import 'package:pay_me_mobile/src/views/screens/tv/components/tv_provider_dropdown.dart';
import 'package:pay_me_mobile/src/views/screens/tv/tv_cable_viewModel.dart';

import '../../../../../app_config/manager/font_manager.dart';
import '../../../../../core/constants/colors.dart';

class BuildTvPackage extends StatelessWidget {
  final TvCableViewModel model;
  const BuildTvPackage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: double.infinity,
          child: Text(
            "Package",
            style: TextStyle(
              color: AppColors.lightBlack,
              fontWeight: AppFontWeight.bold,
              fontSize: AppFontSize.size16,
            ),
          ),
        ),
        const SizedBox(height: 10),
        BuildTVPackageDropdown(
          model: model,
        ),
      ],
    );
  }
}
