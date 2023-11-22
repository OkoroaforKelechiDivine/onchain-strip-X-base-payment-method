import 'package:flutter/material.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';

class BuildNetworkDropDown extends StatefulWidget {
  const BuildNetworkDropDown({super.key});

  @override
  State<BuildNetworkDropDown> createState() => _BuildNetworkDropDownState();

}

class _BuildNetworkDropDownState extends State<BuildNetworkDropDown> {
  String? selectedNetwork;
  List<DropdownMenuItem<String>> networkItems = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
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
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: "Choose Network",
            hintStyle: const TextStyle(
                color: AppColors.lightGrey,
                fontSize: AppFontSize.size14,
                fontWeight: AppFontWeight.light),
            filled: true,
            fillColor: AppColors.pureWhite,
            focusColor: AppColors.pureWhite,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          value: selectedNetwork,
          onChanged: (newValue) {
            setState(() {
              selectedNetwork = newValue;
            });
          },
          items: networkItems,
        ),
      ),
    );
  }
}
