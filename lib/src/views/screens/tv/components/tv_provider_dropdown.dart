import 'package:flutter/material.dart';
import 'package:pay_me_mobile/data/model/response/tv_cable/tv_cable_package_response.dart';
import 'package:pay_me_mobile/src/views/screens/tv/tv_cable_viewModel.dart';

import '../../../../../app_config/manager/font_manager.dart';
import '../../../../../core/constants/colors.dart';

class BuildTVPackageDropdown extends StatelessWidget {
  final TvCableViewModel model;
  const BuildTVPackageDropdown({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightGrey,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonFormField<TvCablePackageResponse>(
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
        value: model.selectedPackageResponse,
        onChanged: (newValue) {
          model.onSelectPackage(newValue);
        },
        items: model.packageItems,
      ),
    );
  }
}
