import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/widgets/app_circular_progress_indicator.dart';
import 'package:pay_me_mobile/data/model/params/save_beneficiary_param.dart';
import 'package:pay_me_mobile/src/views/screens/bottom_nav.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/transfer_success_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/cores.dart';

class TransferSuccessPage extends StatelessWidget {
  final String message;
  final SaveBeneficiaryParam beneficiary;
  const TransferSuccessPage(
      {super.key, required this.message, required this.beneficiary});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TransferSuccessViewmodel(),
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  SvgPicture.asset(
                    AppAssets.complete,
                    height: 200.0,
                    width: 200.0,
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Transaction Successful',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  AppCustomButton(
                    onPressed: () {
                      model.saveBeneficiary(beneficiary);
                    },
                    color: Colors.transparent,
                    borderColor: AppColors.lightGreen,
                    borderWidth: 1,
                    loading: model.isLoading,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AppText(
                          "Save as Beneficiary",
                          color: AppColors.lightGreen,
                          fontSize: 18,
                        ),
                        if (model.isLoading)
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            child: const AppCircularProgressIndicator(
                              size: 20,
                              color: AppColors.lightGreen,
                            ),
                          )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  AppCustomButton(
                    onPressed: () {
                      navigationService.pushAndRemoveUntil(const BottomNav());
                    },
                    title: "Done",
                    color: AppColors.lightGreen,
                  ),
                  const SizedBox(height: 24.0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
