import 'package:flutter/cupertino.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_airtime/components/amount-text-field.dart';
import 'package:pay_me_mobile/src/views/screens/tv/components/tv_provider_textfield.dart';

import '../../../../../app_config/manager/font_manager.dart';
import '../../../../../core/constants/colors.dart';

class BuildDecoderName extends StatelessWidget {
  const BuildDecoderName({super.key});

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
                "Decoder Number",
                style: TextStyle(
                  color: AppColors.lightBlack,
                  fontWeight: AppFontWeight.bold,
                  fontSize: AppFontSize.size16,
                ),
              ),
            ),
          ),
          BuildTvProviderTextField(),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Amount',
                  style: TextStyle(
                    fontSize: AppFontSize.size16,
                    color: AppColors.lightBlack,
                    fontWeight: AppFontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Text(
                  'Balance: NGN7,361.87',
                  style: TextStyle(
                    fontSize: AppFontSize.size16,
                    color: AppColors.lightBlack,
                    fontWeight: AppFontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          //BuildAmountTextField(),
        ],
      ),
    );
  }
}
