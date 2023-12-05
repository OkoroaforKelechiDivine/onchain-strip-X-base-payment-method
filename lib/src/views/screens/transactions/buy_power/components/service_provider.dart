import 'package:flutter/cupertino.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_power/buy_power_view_model.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_power/components/electricity_provider.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';

class BuildServiceProviders extends StatelessWidget {
  final BuyPowerViewModel model;
  const BuildServiceProviders({super.key, required this.model});

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
        BuildElectricityProviderDropdown(
          viewModel: model,
        ),
      ],
    );
  }
}
