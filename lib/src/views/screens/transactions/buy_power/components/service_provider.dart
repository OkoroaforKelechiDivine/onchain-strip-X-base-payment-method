import 'package:flutter/cupertino.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_power/components/electricity_provider.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';

class BuildServiceProviders extends StatelessWidget {
  const BuildServiceProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "Service provider",
                style: TextStyle(
                  color: AppColors.lightBlack,
                  fontWeight: AppFontWeight.bold,
                  fontSize: AppFontSize.size16,
                ),
              ),
            ),
          ),
          BuildElectricityProviderDropdown(),
        ],
      ),
    );
  }
}
