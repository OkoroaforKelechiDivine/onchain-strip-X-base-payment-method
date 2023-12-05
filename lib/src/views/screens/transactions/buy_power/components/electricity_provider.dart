import 'package:flutter/material.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_power/buy_power_view_model.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';

// class BuildElectricityProviderDropdown extends StatelessWidget {
//   final BuyPowerViewModel viewModel;
//    BuildElectricityProviderDropdown({super.key, required this.viewModel});

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

class BuildElectricityProviderDropdown extends StatelessWidget {
  final BuyPowerViewModel viewModel;
  const BuildElectricityProviderDropdown({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightGrey,
        ),
        borderRadius: BorderRadius.circular(8),
        // boxShadow: [
        //   BoxShadow(
        //     color: AppColors.lightGrey.withOpacity(0.1),
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: const Offset(0, 3),
        //   ),
        // ],
      ),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          hintText: "Choose Electricity Provider",
          hintStyle: const TextStyle(
            color: AppColors.lightGrey,
            fontSize: AppFontSize.size14,
            fontWeight: AppFontWeight.light,
          ),
          filled: true,
          fillColor: AppColors.pureWhite,
          focusColor: AppColors.pureWhite,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        value: viewModel.selectedElectricityProvider,
        onChanged: (newValue) {
          viewModel.onSelectProvider(newValue);
          //selectedElectricityProvider = newValue;
        },
        items: viewModel.electricityProviderItems,
      ),
    );
  }
}
