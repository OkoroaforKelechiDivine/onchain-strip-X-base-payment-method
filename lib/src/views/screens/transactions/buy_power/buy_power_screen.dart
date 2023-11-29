import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_power/buy_power_view_model.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_power/components/meter_name.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_power/components/package.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_power/components/service_provider.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/utilities/app_fonts.dart';
import '../../../widgets/app_button.dart';

class BuyPowerScreen extends StatefulWidget {
  const BuyPowerScreen({super.key});

  @override
  State<BuyPowerScreen> createState() => _BuyPowerScreenState();
}

class _BuyPowerScreenState extends State<BuyPowerScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BuyPowerViewModel>.reactive(
      viewModelBuilder: () => BuyPowerViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              'Buy Power',
              style: sans(color: AppColors.lightGreen),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                BuildServiceProviders(model: model),
                const SizedBox(height: 10),
                BuildPackage(model: model),
                const SizedBox(height: 10),
                const SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(left: 26.0),
                    child: Text(
                      "Phone Number",
                      style: TextStyle(
                        color: AppColors.lightBlack,
                        fontWeight: AppFontWeight.bold,
                        fontSize: AppFontSize.size16,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 8.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.lightGrey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: model.phoneNumberController,
                        decoration: InputDecoration(
                          hintText: "Enter Phone number",
                          hintStyle: const TextStyle(
                              color: AppColors.lightGrey,
                              fontSize: AppFontSize.size14,
                              fontWeight: AppFontWeight.light),
                          filled: true,
                          fillColor: AppColors.pureWhite,
                          focusColor: AppColors.pureWhite,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                      ),
                    ),
                  ),
                ),
                BuildMeterName(
                  viewModel: model,
                ),
                Container(
                  margin: EdgeInsets.only(top: 24.h),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 100,
                      right: 100,
                    ),
                    child: AppButton.filledButton(context,
                        onTap: () {},
                        color: AppColors.lightGreen,
                        child: Text(
                          'Next',
                          style: cairo(),
                        )),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
