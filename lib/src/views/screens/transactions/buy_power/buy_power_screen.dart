import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/core/widgets/loader.dart';
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
      onViewModelReady: (viewModel) {
        viewModel.init();
      },
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
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      BuildServiceProviders(model: model),
                      const SizedBox(height: 16),
                      BuildPackage(model: model),
                      const SizedBox(height: 16),
                      const Text(
                        "Phone Number",
                        style: TextStyle(
                          color: AppColors.lightBlack,
                          fontWeight: AppFontWeight.bold,
                          fontSize: AppFontSize.size16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 10),
                      AppCustomTextField(
                        textEditingController: model.phoneNumberController,
                        hintText: 'Enter Phone Number',
                        textInputType: TextInputType.number,
                        maxLength: 10,
                        padding: const EdgeInsets.all(18),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter phone number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      BuildMeterName(
                        viewModel: model,
                      ),
                      const SizedBox(height: 16),
                      AppCustomButton(
                        loading: model.buyingPower,
                        onPressed: () {
                          model.processPower();
                        },
                        title: 'Buy Power',
                        color: AppColors.lightGreen,
                        padding: const EdgeInsets.all(18),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: model.buyingPower,
                child: const Positioned(
                  child: AppLoader(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
