import 'package:flutter/cupertino.dart';
import 'package:pay_me_mobile/src/views/screens/tv/components/package_dropdown.dart';
import 'package:pay_me_mobile/src/views/screens/tv/tv_cable_viewModel.dart';

import '../../../../../app_config/manager/font_manager.dart';
import '../../../../../core/constants/colors.dart';

class BuildTVServiceProviders extends StatelessWidget {
  final TvCableViewModel model;
  const BuildTVServiceProviders({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: double.infinity,
          child: Text(
            "Service provider",
            style: TextStyle(
              color: AppColors.lightBlack,
              fontWeight: AppFontWeight.bold,
              fontSize: AppFontSize.size16,
            ),
          ),
        ),
        const SizedBox(height: 10),
        TvServiceProviderDropdown(
          viewModel: model,
        ),
      ],
    );
  }
}
