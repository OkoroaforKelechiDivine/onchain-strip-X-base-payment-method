import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_power/buy_power_view_model.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';

// class BuildPackageDropdown extends StatefulWidget {
//   const BuildPackageDropdown({super.key});

//   @override
//   State<BuildPackageDropdown> createState() => _BuildPackageDropdownState();
// }

// class _BuildPackageDropdownState extends State<BuildPackageDropdown> {

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

class BuildPackageDropdown extends StatelessWidget {
  final BuyPowerViewModel model;
  const BuildPackageDropdown({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
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
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: "Choose Package",
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
          value: model.selectedPackage,
          onChanged: (newValue) {
            model.onSelectPackage(newValue);
          },
          items: model.packageItems,
        ),
      ),
    );
  }
}
